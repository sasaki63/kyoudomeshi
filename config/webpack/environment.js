const { environment } = require('@rails/webpacker');

const webpack = require('webpack');

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    jquery: 'jquery/src/jquery',
  })
);

// 追加: エントリーポイントの設定
environment.config.set('entry', {
  application: './app/javascript/application.js'
});

module.exports = environment;
