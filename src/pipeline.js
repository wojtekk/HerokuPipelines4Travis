const heroin = require('heroin-js');

if (!process.argv[2]) {
  console.error('Config file does not exists');
}

const configFile = process.argv[2];
console.log(configFile);
// eslint-disable-next-line import/no-dynamic-require
const configuration = require(configFile);

const configurator = heroin(process.env.HEROKU_API_KEY, { debug: false });
configurator.pipeline(configuration).then((result) => {
  console.log(result);
});
