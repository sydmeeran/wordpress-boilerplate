const NODE_ENV = process.env.NODE_ENV || 'development'
if ( NODE_ENV === 'development') {
  require('dotenv').config()
}

const express = require('express')
const next = require('next')
const fetch = require('isomorphic-fetch')
const routes = require('./routes')
const app = next({ dev: process.env.NODE_ENV !== 'production' })
const server = express()
const handle = routes.getRequestHandler(app)
const path = require('path')
const favicon = require('serve-favicon')
const port = process.env.FRONTEND_PORT || 8081
server.use( favicon(path.join(__dirname, "../static", "favicon.ico")) )

function replaceAll(string, omit, place, prevstring) {
  if (prevstring && string === prevstring)
    return string;
  prevstring = string.replace(omit, place);
  return replaceAll(prevstring, omit, place, string)
}

const redirects = [
  { from: '/home', to: '/' },
]

app.prepare()
  .then(() => {

    redirects.forEach(({ from, to, type = 301, method = 'get' }) => {
      server[method](from, (req, res) => {
        res.redirect(type, to)
      })
    })

    server.get('/sitemap*.xml', (req, res) => {
      let sitemapName = req.url
      sitemapName = sitemapName.replace('/sitemap', '').replace('.xml', '')

      res.type('text/xml')
      fetch(`${process.env.WORDPRESS_BASE_URL}/sitemap${sitemapName}.xml`)
        .then(response => response.text())
        .then(data => {
          return res.send(replaceAll(data, process.env.WORDPRESS_BASE_URL, process.env.BASE_URL));
        })
    })

    server.use(handle)
      .listen(port, (err) => {
        if (err) throw err
        // disable eslint on the console line here
        // eslint-disable-next-line
        console.log('Listening on http://localhost:' + port) 
      });
  });
