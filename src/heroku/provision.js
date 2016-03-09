'use strict';

var heroin = require('heroin-js');

if( !process.argv[2] ) {
  console.error('Config file does not exists');
}

let configFile = process.argv[2];
console.log(configFile);
let configuration = require(configFile);

let configurator = heroin(process.env.HEROKU_API_KEY, {debug: false});
configurator(configuration);

