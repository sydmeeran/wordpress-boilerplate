import React from 'react'
import { withRouter } from 'next/router'

class Preview extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      previewPage: null,
      inPreview: null
    }
  }

  static async getInitialProps ({ query }) {
    return { };
  }

  componentDidMount () {
  
  }

  render () {
    return null;
  }
}

Preview.propTypes = {
}

export default withRouter(Preview)
