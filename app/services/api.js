import fetch from 'isomorphic-fetch'
import Config from './config'

class RestApi {
  getCacheKey (args) {
    return args.join('.')
  }

  async getData(endpoint) {
    const response = await fetch(`${Config.apiUrl}/${endpoint}`, {
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      }
    })


    const jsonData = await response.json()
    return jsonData
  }
}

export default RestApi
