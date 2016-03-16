var path = require('path');
var webpack = require('webpack');

// Path to rails javascript assets folder
var assets_path = __dirname + '/../app/assets';
var pub_path = __dirname + '/../public';

module.exports = {
    entry: './main.jsx',
    output: {path: pub_path + '/js', filename: 'missionary-grammars.js'},
    devtool: 'source-map',
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