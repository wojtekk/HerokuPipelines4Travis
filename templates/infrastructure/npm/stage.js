const _ = require('lodash');

const base = require('./base');

const stage = {
  name: process.env.HP4T_HEROKU_APPNAME_STAGE,
  addons: {},
  config_vars: {},
  domains: [
    process.env.HP4T_HEROKU_APPNAME_STAGE,
  ],
  formation: [
    {
      process: 'web',
      quantity: 1,
      size: 'Free',
    },
  ],
};

const configuration = _.merge({}, base, stage);

module.exports = configuration;
