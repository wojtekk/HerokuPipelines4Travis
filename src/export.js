'use strict';

const heroin = require('heroin-js');

if (!process.argv[2]) {
    console.error('App name is empty');
    return 1;
}
let appName = process.argv[2];
let herokuApiKey;
if (process.argv[3]) {
    herokuApiKey = process.argv[3];
} else if (process.env.HEROKU_API_KEY) {
    herokuApiKey = process.env.HEROKU_API_KEY;
}
if (!herokuApiKey) {
    console.error('Heroku API key is empty');
    return 2;
}

let configurator = heroin(herokuApiKey, {debug: false});

configurator.export(appName).then(function (result) {
    console.log(result);
});
