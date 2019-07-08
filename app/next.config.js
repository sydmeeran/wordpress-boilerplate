const withSass = require('@zeit/next-sass')
const webpack = require('webpack')
const withFonts = require('next-fonts');

const { ANALYZE } = process.env
const NODE_ENV = process.env.NODE_ENV || 'development'

if ( NODE_ENV === 'development') {
  require('dotenv').config()
}

const commonsChunkConfig = (config, test = /\.css$/) => {
  config.plugins = config.plugins.map(plugin => {
    if (
      plugin.constructor.name === 'CommonsChunkPlugin' &&
      plugin.minChunks != null
    ) {
      const defaultMinChunks = plugin.minChunks;
      plugin.minChunks = (module, count) => {
        if (module.resource && module.resource.match(test)) {
          return true;
        }
        return defaultMinChunks(module, count);
      };
    }
    return plugin;
  });
  return config;
};

module.exports = withFonts(withSass({
  dev: NODE_ENV === 'development',
  cssModules: false,

  cssLoaderOptions: {
    importLoaders: 1,
    localIdentName: "[local]___[hash:base64:5]",
    camelCase: 'dashes'
  },
  sassLoaderOptions: {
    includePaths: ['./node_modules']
  },

  // normally, next.js selects a random port for the websocket at start-up.
  // This setting forces it to use the port we define here, which is helpful
  // for people running within a VM / Docker container who need to explicity
  // open ports.
  onDemandEntries: {
    websocketPort: 43014
  },

  publicRuntimeConfig: {
    NODE_ENV: NODE_ENV,
    BASE_URL: process.env.WP_WEB_SCHEME + "://" + process.env.WP_WEB_DOMAIN + ":" + process.env.WP_WEB_PORT, // process.env.WP_HOME,
    WORDPRESS_BASE_URL: process.env.WP_WEB_SCHEME + "://" + process.env.WP_WEB_DOMAIN + ":" + process.env.WP_WEB_PORT,
    CACHE_ENABLED: process.env.CACHE_ENABLED,
    BROWSER_CACHE_TIMEOUT: process.env.BROWSER_CACHE_TIMEOUT,
    SERVER_CACHE_TIMEOUT: process.env.SERVER_CACHE_TIMEOUT,
    GOOGLE_MAPS_API_KEY: process.env.GOOGLE_MAPS_API_KEY,
    INCLUDE_GTM: process.env.INCLUDE_GTM
  },

  webpack: (config, { dev, isServer }) => {

    config.node = {
      fs: 'empty'
    }

    const originalEntry = config.entry
    config.entry = async () => {
      const entries = await originalEntry()

      if (
        entries['main.js'] &&
        !entries['main.js'].includes('./lib/polyfills.js')
      ) {
        entries['main.js'].unshift('./lib/polyfills.js')
      }

      return entries
    }

    if (dev) {
      config.module.rules.push({
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'eslint-loader',
        options: {
          // eslint options (if necessary)
        }
      });
    }

    if (ANALYZE) {
      const { BundleAnalyzerPlugin } = require('webpack-bundle-analyzer')
      config.plugins.push(new BundleAnalyzerPlugin({
        analyzerMode: 'server',
        analyzerPort: isServer ? 8888 : 8889,
        openAnalyzer: true
      }))
    }

    // add postcss loader
    config.module.rules.push({
      test: /\.css$/,
      use: ['raw-loader', 'postcss-loader']
    })


    config.module.rules.push({
      test: /\.svg$/,
      use: ['@svgr/webpack']
    })
    
    // load default environment variables
    config.plugins.push(
      new webpack.EnvironmentPlugin( new webpack.EnvironmentPlugin({
        NODE_ENV: 'development', // use 'development' unless process.env.NODE_ENV is defined
        DEBUG: false
      }) )
    )

    config = commonsChunkConfig(config, /\.(sass|scss|css)$/);

    return config
  }
}))
