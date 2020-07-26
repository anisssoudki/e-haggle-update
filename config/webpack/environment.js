const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
    // popper: ['popper.js', 'default'] // need popper.js if you are working bootstrap also remember to import bootstrap in the application.scss file
  })
)

module.exports = environment