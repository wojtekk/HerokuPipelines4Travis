const deploy = require('heroku-deploy-tarball');
const parseArgs = require('minimist');
const colors = require('colors');

function error(message, code) {
  console.error(colors.red(message));
  process.exit(code);
}

const argv = parseArgs(process.argv.slice(2), {
  alias: {
    'api-key': 'k',
  },
});

if (!argv._[0]) {
  return error('You must specify an archive file.');
}

if (!argv._[1]) {
  return error('You must specify an app name.');
}

if (!argv['api-key']) {
  return error('You must specify an API Key.');
}

const config = {
  app: argv._[1],
  tarball: argv._[0],
  credentials: {
    username: 'deploy',
    password: argv['api-key'],
  },
};

deploy(config);
