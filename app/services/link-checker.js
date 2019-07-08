// check if the link is internal or external
import getConfig from 'next/config'
let baseUrl = getConfig().publicRuntimeConfig.BASE_URL

export default (url) => {
  return !url.includes(baseUrl)
}
