import React from 'react'
import PropTypes from 'prop-types';
import { withRouter } from 'next/router'
import dynamic from 'next/dynamic'
import RestApi from '../../services/api'

class Page extends React.Component {
  static async getInitialProps({ query }) {
    const api = new RestApi();
    const slug = query.slug ? query.slug : 'home';
    let result = api.getData(`page/${slug}`);
    const data = await result;
    return await data;
  }

  constructor (props) {
    super(props) 
    this.state = {
      components: []
    }
  }

  componentDidMount() {
    const { data } = this.props;
    if (data && data.acf && data.acf.components && data.acf.components.flexible_content) {
      this.setState({
        components: data.acf.components.flexible_content.map(c => {
          return {
            Component: dynamic(() =>
              import(`../../components/flexible_content/${c.acf_fc_layout}/`).catch(() => ({
                default: () => <div>Error loading component: {c.acf_fc_layout}</div>,
              })),
            ),
            data: c
          };
        })
      })
    }
  }


  render () {
    let index = 1;
    return (
      <React.Fragment>
        {this.state.components.map(c => {
          const { Component, data } = c;
          return <Component key={`${this.props.data.post_name}_${index++}`} {...data} />;
        })}
      </React.Fragment>
    )
  }
}

Page.propTypes = {
  data: PropTypes.any
}

export default withRouter(Page)