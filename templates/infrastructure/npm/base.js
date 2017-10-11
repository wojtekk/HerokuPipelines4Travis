const configuration = {
  region: 'eu',
  maintenance: false,
  stack: 'heroku-16',
  config_vars: {},
  addons: {},
  collaborators: [],
  buildpacks: [
    'heroku/nodejs',
  ],
  features: {
    'runtime-dyno-metadata': {
      enabled: true,
    },
    'log-runtime-metrics': {
      enabled: true,
    },
    'http-session-affinity': {
      enabled: false,
    },
    'http-shard-header': {
      enabled: false,
    },
    'http-end-to-end-continue': {
      enabled: false,
    },
    preboot: {
      enabled: false,
    },
  },
};

module.exports = configuration;
