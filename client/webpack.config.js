var path = require('path');
var webpack = require('webpack');

// Path to rails javascript assets folder
var assets_path = __dirname + '/../app/assets';

module.exports = {
    entry: './main.jsx',
    output: {path: assets_path + '/javascripts', filename: 'missionary-grammars.js'},
    extensions: ['', 'js', 'jsx'],
    module: {
        loaders: [
            {
                test: /.jsx?$/,
                loader: 'babel-loader',
                exclude: /node_modules/,
                query: {
                    cacheDirectory: true,
                    presets: ['es2015', 'react']
                }
            }
        ]
    }
};