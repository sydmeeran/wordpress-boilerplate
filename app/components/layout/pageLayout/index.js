import React from 'react'
import Header from '../header'
import Footer from '../footer'
import PropTypes from 'prop-types'

const PageLayout = (props) => {
  return <div>
    <Header />
    {props.children}
    <Footer />
  </div>
}

PageLayout.propTypes = {
  children: PropTypes.any,
}

export default PageLayout;
