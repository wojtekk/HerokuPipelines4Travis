const configuration = {
  region: 'eu',
  maintenance: false,
  stack: 'heroku-16',
  config_vars: {},
  addons: {},
  collaborators: [],
  features: {
    'runtime-dyno-metadata': {
      enabled: false,
    },
    'log-runtime-metrics': {
      enabled: true,
    },
    'http-session-affinity': {
      enabled: false,
    },
    preboot: {
      enabled: false,
    },
    'http-shard-header': {
      enabled: false,
    },
    'http-end-to-end-continue': {
      enabled: false,
    },
  },
};

module.exports = configuration;
