const R = require('Ramda');
const assert = require('assert');


/**
 * padLeft
 */
const padLeft = R.concat;
module.exports.padLeft = padLeft;
// tests
assert(padLeft('_left ')('value') === '_left value');


/**
 * padRight
 */
const padRight = R.flip(R.concat);
module.exports.padRight = padRight;
// tests
assert(padRight(' right_')('value') === 'value right_');


/**
 * pad
 */
const pad = R.curry((padding, value) => R.pipe(
  padLeft(padding),
  padRight(padding)
)(value));
module.exports.pad = pad;
// tests
assert(pad(' _both_ ')('value') === ' _both_ value _both_ ');
