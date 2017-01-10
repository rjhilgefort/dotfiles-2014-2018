let S = require('shelljs');
const R = require('ramda');

// Make exec silent by default
S.exec = R.wrap(S.exec, (fn, command, options, ...rest) => {
  options = R.merge({ silent: true }, options);
  return fn(command, options, ...rest);
});

module.exports = S;
