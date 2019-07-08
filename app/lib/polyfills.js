/* eslint no-extend-native: 0 */
// core-js comes with Next.js. So, you can import it like below
import './modernizr'
import includes from 'core-js/library/fn/string/virtual/includes'
import assign from 'core-js/library/fn/object/assign'
import 'url-polyfill'
const svg4everybody = require('svg4everybody')

// Add your polyfills
// This files runs at the very beginning (even before React and Next.js core)

// Add your polyfills
// This files runs at the very beginning (even before React and Next.js core)
String.prototype.includes = includes
Object.assign = assign

svg4everybody()
