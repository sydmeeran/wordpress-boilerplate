import React from 'react'
import App, { Container } from 'next/app'
import 'cross-fetch/polyfill'
import NProgress from 'nprogress'
import Router from 'next/router'
import '../scss/app.scss'

import PageLayout from '../components/layout/pageLayout'
import NotFound from './_error'

Router.events.on('routeChangeStart', url => {
  NProgress.start()
})
Router.events.on('routeChangeComplete', () => NProgress.done())
Router.events.on('routeChangeError', () => NProgress.done())

class MyApp extends App {
  static async getInitialProps({ Component, ctx }) {
    let pageProps = {};

    if (Component.getInitialProps) {
      pageProps = await Component.getInitialProps(ctx);
    }

    // this exposes the query to the user
    pageProps.query = ctx.query;

    return { pageProps };
  }
  
  componentDidMount() {
  }

  render () {
    const { Component, pageProps } = this.props

    return (
      <Container>     
        <PageLayout>
          <Component {...pageProps} />
          <style jsx global>{`
            .page-transition-enter {
              opacity: 0;
            }
            .page-transition-enter-active {
              opacity: 1;
              transition: opacity 400ms;
            }
            .page-transition-exit {
              opacity: 1;
            }
            .page-transition-exit-active {
              opacity: 0;
              transition: opacity 300ms;
            }

            .react-reveal {
              padding-top: 20px;
              opacity: 0;
              max-width: 100%;
              width: 100%;
            }
            

            .react-reveal.fadeIn {
              opacity: 1;
              transition: all 600ms;
            }

            .react-reveal.moveUp {
              padding-top: 0;
              margin-top: 0;
              transition: all 600ms;
            }

            .react-reveal.moveUpInstant {
              padding-top: 0;
              margin-top: 0;
              transition: all 1ms;
            }
          `}
          </style>
        </PageLayout>  
      </Container>
    )
  }
}

export default MyApp
