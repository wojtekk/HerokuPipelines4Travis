const pipeline = {
  name: process.env.HP4T_HEROKU_APPNAME_PRODUCTION.split('.').shift(),
  apps: {
    staging: process.env.HP4T_HEROKU_APPNAME_STAGE,
    production: process.env.HP4T_HEROKU_APPNAME_PRODUCTION,
  },
};

module.exports = pipeline;
