const path = require('path');

module.exports = {
  entry: {
    app: path.resolve(__dirname, 'src/app.js'),
  },

  module: {
    loaders: [
      {
        loader: "babel-loader",

        include: [
          path.resolve(__dirname, 'src'),
        ],

        test: /\.js?$/,
      },
    ],

    rules: [{
      test: /\.scss$/,
      include: [
        path.resolve(__dirname, 'src'),
      ],
      use: [{
        loader: "style-loader" // creates style nodes from JS strings
      }, {
        loader: "css-loader" // translates CSS into CommonJS
      }, {
        loader: "sass-loader" // compiles Sass to CSS
      }]
    }]

  },
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'dist'),
  },
  devServer: {
    contentBase: path.resolve(__dirname, "dist")
  }
};
