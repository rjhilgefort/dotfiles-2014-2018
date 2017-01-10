const R = require('Ramda');
const chalk = require('chalk');
const assert = require('assert');
const pad = require('./pad');


const _withStyle = R.curry((style, message) => {
  R.pipe(
    style,
    console.log
  )(message);
});
module.exports._withStyle = _withStyle;


const _withPrefix = R.curry((stylePrefix, prefix, style, message) => {
  R.pipe(
    pad.left(' '),
    style,
    R.pipe(
      stylePrefix,
      pad.left
    )(prefix),
    console.log
  )(message);
});
module.exports._withPrefix = _withPrefix;


const log = _withStyle(chalk.reset);
module.exports.log = log;


const info = _withStyle(chalk.blue);
module.exports.info = info;


const warning = _withStyle(chalk.yellow);
module.exports.warning = warning;


const error = _withStyle(chalk.red);
module.exports.error = error;


const header = _withStyle(chalk.bold.bgGreen.black);
module.exports.header = header;
