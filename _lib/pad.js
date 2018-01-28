const R = require('ramda');
const assert = require('assert');


/**
 * left
 */
const left = R.concat;
module.exports.left = left;

assert(left('_left ')('value') === '_left value');


/**
 * right
 */
const right = R.flip(R.concat);
module.exports.right = right;

assert(right(' right_')('value') === 'value right_');


/**
 * both
 */
const both = R.curry((padding, value) => R.pipe(
  left(padding),
  right(padding)
)(value));
module.exports.both = both;

assert(both(' _both_ ')('value') === ' _both_ value _both_ ');


/**
 * brackets
 */
const brackets = R.pipe(
  left('['),
  right(']')
);
module.exports.brackets = brackets;

assert(brackets('value') === '[value]');
