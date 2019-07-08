const routes = require('next-routes')

module.exports = routes()
  .add({ name: 'home', pattern: '/', page: 'Page' })
  .add({ name: 'firstLevel', pattern: '/:slug', page: 'Page' })
  .add({ name: 'page/preview', pattern: '/:id/preview', page: 'Preview' }) 
