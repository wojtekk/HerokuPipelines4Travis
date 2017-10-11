const _ = require('lodash');

const base = require('./base');

const production = {
  name: process.env.HP4T_HEROKU_APPNAME_PRODUCTION,
  addons: {},
  config_vars: {},
  domains: [
    `${process.env.HP4T_HEROKU_APPNAME_PRODUCTION}.herokuapp.com`,
  ],
  formation: [
    {
      process: 'web',
      quantity: 1,
      size: 'Free',
    },
  ],
  // You can enable preboot for professional dynos only
  // features: {
  //   preboot: {
  //     enabled: true,
  //   },
  // },
};

const configuration = _.merge({}, base, production);

module.exports = configuration;
