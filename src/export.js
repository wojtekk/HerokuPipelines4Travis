const heroin = require('heroin-js');

if (!process.argv[2]) {
  console.error('App name is empty');
  process.exit(1);
}
const appName = process.argv[2];
let herokuApiKey;
if (process.argv[3]) {
  // eslint-disable-next-line prefer-destructuring
  herokuApiKey = process.argv[3];
} else if (process.env.HEROKU_API_KEY) {
  herokuApiKey = process.env.HEROKU_API_KEY;
}
if (!herokuApiKey) {
  console.error('Heroku API key is empty');
  process.exit(2);
}

const configurator = heroin(herokuApiKey, {
  debug: false,
});

configurator.export(appName)
  .then((result) => {
    console.log(result);
  });
