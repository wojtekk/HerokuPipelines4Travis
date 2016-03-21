var _ = require('lodash');

var baseConfig = require('./base');

var stage = {
  name: process.env.HP4T_HEROKU_APPNAME_STAGE,
  addons: {},
  config_vars: {},
  domains: [ process.env.HP4T_HEROKU_APPNAME_STAGE+'.herokuapp.com' ],
  formation: [
    {
      process: 'web',
      quantity: 1,
      size: 'Free'
    }
  ]
};

var configuration = _.merge({}, baseConfig, stage);

module.exports = configuration;
