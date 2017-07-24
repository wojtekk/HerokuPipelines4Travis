const _ = require('lodash');

const baseConfig = require('./base');

const production = {
  name: process.env.HP4T_HEROKU_APPNAME_PRODUCTION,
  addons: {},
  config_vars: {},
  domains: [`${process.env.HP4T_HEROKU_APPNAME_PRODUCTION}.herokuapp.com`],
  collaborators: [],
  formation: [
    {
      process: 'web',
      quantity: 1,
      size: 'Free',
    },
  ],
};

const configuration = _.merge({}, baseConfig, production);

module.exports = configuration;
