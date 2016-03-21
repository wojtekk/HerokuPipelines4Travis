var _ = require('lodash');

var baseConfig = require('./base');

var production = {
  name: process.env.HP4T_HEROKU_APPNAME_PRODUCTION,
  addons: {},
  config_vars: {},
  domains: [ process.env.HP4T_HEROKU_APPNAME_PRODUCTION+'.herokuapp.com'],
  collaborators: [],
  formation: [
    {
      process: 'web',
      quantity: 1,
      size: 'Free'
    }
  ]
};

var configuration = _.merge({}, baseConfig, production);

module.exports = configuration;
