'use strict';

var heroin = require('heroin-js');

if( !process.argv[2] ) {
  console.error('Config file does not exists');
}

if( !process.env.HEROKU_API_KEY ) {
  throw new Error('Please set env var for HEROKU_API_KEY');
}

let configFile = process.argv[2];
console.log(configFile);
let configuration = require(configFile);

let configurator = heroin(process.env.HEROKU_API_KEY, {debug: false});
configurator(configuration);

