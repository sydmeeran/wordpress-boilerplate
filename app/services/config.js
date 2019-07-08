import getConfig from 'next/config'

let nodeEnv = getConfig().publicRuntimeConfig.NODE_ENV;
let baseUrl = getConfig().publicRuntimeConfig.BASE_URL;
let apiUrl = getConfig().publicRuntimeConfig.WORDPRESS_BASE_URL;
let googleMapsKey = getConfig().publicRuntimeConfig.GOOGLE_MAPS_API_KEY;
let includeGTM = getConfig().publicRuntimeConfig.INCLUDE_GTM;

const Config = {
  nodeEnv: `${nodeEnv}`,
  baseUrl: `${baseUrl}`,
  graphqlUrl: apiUrl + '/graphql',
  apiUrl: apiUrl + '/wp-json/site/v1',
  cache: {
    enabled: !!getConfig().publicRuntimeConfig.CACHE_ENABLED,
    browserTimeout: +getConfig().publicRuntimeConfig.BROWSER_CACHE_TIMEOUT,
    serverTimeout: +getConfig().publicRuntimeConfig.SERVER_CACHE_TIMEOUT
  },
  googleMapsKey,
  includeGTM
}

export default Config
