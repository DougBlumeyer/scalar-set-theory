module.exports = {
  devtool: 'source-map',
  entry: './app/entry',
  output: {
    path: 'dist',
    filename: 'dist.js',
  },
  module: {
    loaders: [
      {
        test: /\.js$/,
        loader: 'babel',
        query: {
          cacheDirectory: true,
        },
        exclude: /node_modules/
      },
      {
        test: /\.css$/,
        loader: 'style!css'
      }
    ]
  },
}