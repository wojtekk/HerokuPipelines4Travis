var heroin = require('heroin-js');

var configurator = heroin(process.env.HEROKU_API_KEY, {debug: false});

configurator.export('').then(function (result) {
  console.log(result);
});

configurator.export('').then(function (result) {
  console.log(result);
});
