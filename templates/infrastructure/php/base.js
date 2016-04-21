var configuration = {
  region: 'eu',
  maintenance: false,
  stack: 'cedar-14',
  config_vars: {},
  addons: {
    logentries: {
      plan: 'logentries:le_tryit'
    },
    librato: {
      plan: 'librato:development'
    }
  },
  collaborators: [],
  features: {
    'runtime-dyno-metadata': {
      enabled: false
    },
    'log-runtime-metrics': {
      enabled: false
    },
    'http-session-affinity': {
      enabled: false
    },
    preboot: {
      enabled: false
    },
    'http-shard-header': {
      enabled: false
    },
    'http-end-to-end-continue': {
      enabled: false
    }
  }
};

module.exports = configuration;
