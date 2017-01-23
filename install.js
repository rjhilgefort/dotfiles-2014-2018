#!/usr/bin/env node

const S = require('shelljs');
const R = require('Ramda');
const _ = require('lodash');
const program = require('commander');
const chalk = require('chalk');
const treis = require('treis');

const pad = require('./_lib/pad');
let echo = require('./_lib/echo');


// Existing options
const existingOptions = ['skip', 'move', 'overwrite'];
const existingOptionsText = R.pipe(
  R.adjust(pad.brackets, 0),
  R.join('/')
)(existingOptions);
const defaultOption = R.head(existingOptions);

program
  .version('0.0.3')
  .usage("[options]")
  .option(`-e, --existing [${defaultOption}]`, `Handle existing directories as ${existingOptionsText}`, `${defaultOption}`)
  .option("-u, --update", 'Update submodules before installing')
  .option("-s, --silent", 'Turn off logging')
  .parse(process.argv);

// Possibly overriden functions
let S_exec = S.exec;
let S_ln = S.ln;
let S_rm = S.rm;
let S_mv = S.mv;


///////////////////////////////////////////////////////////////////////////////
// Handle options
///////////////////////////////////////////////////////////////////////////////

// Handle: `existing`
// Default to 'move' if nothing was specified
if (!R.contains(program.existing, ['overwrite', 'move', 'skip'])) {
  program.existing = 'move';
}

// Handle: `update`
// N/A

// Handle: `silent`
// Wrap all methods that act on the users file system
if (!program.silent) {
  const makeVerbose = (name) => (fn, ...args) => {
    R.pipe(
      (R.isEmpty(name) ? R.identity : R.prepend(name)),
      R.map(chalk.bold.green),
      R.compose(
        R.prepend,
        chalk.bold.red
      )('==>'),
      R.join(' '),
      S.echo
    )(args);

    return fn(...args);
  };

  // TODO: Don't use `wrap`:
  // http://stackoverflow.com/questions/41204219/ramda-how-to-modify-function-parameters-without-r-wrap/41210224
  S_exec = R.wrap(S_exec, makeVerbose(''));
  S_ln = R.wrap(S_ln, makeVerbose('ln'));
  S_rm = R.wrap(S_rm, makeVerbose('rm'));
  S_mv = R.wrap(S_mv, makeVerbose('mv'));
}


///////////////////////////////////////////////////////////////////////////////
// Echo Methods
///////////////////////////////////////////////////////////////////////////////

// Existing action echo functions
const styleExistingAction = R.pipe(
  _.capitalize,
  pad.right('ing'),
  pad.brackets,
  R.ifElse(
    R.test(/Overwrite/),
    R.pipe(
      chalk.bgRed,
      chalk.white
    ),
    R.pipe(
      chalk.bgYellow,
      chalk.black
    )
  )
);
const echoWithExistingActionPrefix = echo._withPrefix(styleExistingAction, R.__, chalk.yellow, R.__);
const existingActionsEchoFunctions = R.pipe(
  R.indexBy(R.identity),
  R.map(echoWithExistingActionPrefix)
)(existingOptions);


const echoSection = R.pipe(
  pad.both(' '),
  pad.both('###'),
  pad.left('\n\n'),
  echo.header
);

echo = R.mergeAll([
  echo,
  existingActionsEchoFunctions,
  { section: echoSection }
]);


///////////////////////////////////////////////////////////////////////////////
// Util methods / Overrides
///////////////////////////////////////////////////////////////////////////////

// We never call this another way
S_ln = R.partial(S_ln, ['-sf']);
S_ln = R.wrap(S_ln, (fn, source, dest) => {
  // Handle existing `dest` directories
  if (S.test('-e', dest)) {
    echo[program.existing](`existing target based on \`-e\` flag: ${dest}`);

    switch (program.existing) {
    case 'overwrite':
      S_rm('-r', dest);
      break;
    case 'move':
      S_mv('-f', dest, `${dest}__`);
      break;
    case 'skip':
      return true;
      break;
    }
  }

  fn(source, dest);
});


///////////////////////////////////////////////////////////////////////////////
echo.section('Make sure submodules are installed');
///////////////////////////////////////////////////////////////////////////////
(() => {
  if (!program.update) return echo.skip('Use `-u` flag to do so.');
  S_exec('git submodule update --init --recursive');
})();


///////////////////////////////////////////////////////////////////////////////
echo.section('Link base16-vim schemes to .vim dir');
///////////////////////////////////////////////////////////////////////////////
(() => {
  return echo.skip('TODO: Decide what to do with this.');

  let source = `${__dirname}/.src/base16-vim/colors`;
  let dest = `${__dirname}/.vim/colors`;

  _.forEach(S.ls(source), (scheme) => {
    S_ln(`${source}/${scheme}`, `${dest}/${scheme}`);
  });
})();


///////////////////////////////////////////////////////////////////////////////
echo.section('.prezto prompt installs');
///////////////////////////////////////////////////////////////////////////////
// TODO: Loop over all prompts in `source` and link. Hardcode the installs for now...
(() => {
  return echo.skip('TODO: Make sure this works...');

  let source = `${__dirname}/.zprezto/modules/prompt/external`;
  let dest = `${__dirname}/.zprezto/modules/prompt/functions`;

  // Pure
  S_ln(`${source}/pure/pure.zsh`, `${dest}/prompt_pure_setup`);
})();


///////////////////////////////////////////////////////////////////////////////
echo.section('Link items at root of dotfiles project');
///////////////////////////////////////////////////////////////////////////////
(() => {
  let projectFiles = [
    '.git', '.gitignore', '.gitmodules', 'TODO.md', 'README.md',
    'install.js', 'node_modules', 'package.json', 'npm-debug.log',
    '.DS_Store', '_lib'
  ];
  let special = ['.spacemacs', '.adobe_photoshop'];
  let blacklist = R.union(projectFiles, special); // TODO: Refactor from a blacklist, to a whitelist

  _.forEach(S.ls('-A', __dirname), (nodeName) => {
    if (R.contains(nodeName, blacklist)) return true;
    S_ln(`${__dirname}/${nodeName}`, `${S.env.HOME}/${nodeName}`);
  });
})();


///////////////////////////////////////////////////////////////////////////////
echo.section('Handle Special: Spacemacs');
///////////////////////////////////////////////////////////////////////////////
(() => {
  S_ln(`${__dirname}/.spacemacs/.spacemacs`,               `${S.env.HOME}/.spacemacs`);
  S_ln(`${__dirname}/.spacemacs/rjhilgefort`,              `${S.env.HOME}/.emacs.d/private/rjhilgefort`);
  S_ln(`${__dirname}/.spacemacs/rjhilgefort/.mc-lists.el`, `${S.env.HOME}/.emacs.d/.mc-lists.el`);
})();


///////////////////////////////////////////////////////////////////////////////
echo.section('Handle Special: Adobe Photoshop Scripts');
///////////////////////////////////////////////////////////////////////////////
// TODO: loop over dotfiles photoshop directory and link all
(() => {
  const photoshopDir = "/Applications/Adobe Photoshop CS6/Presets/Scripts";
  const photoshopFile = `${photoshopDir}/BatchCropAndStriaghten.jsx`;

  if (!S.test('-d', photoshopDir)) return echo.skip('Photoshop directory not found.');

  S_ln(`${__dirname}/.adobe_photoshop/BatchCropAndStriaghten.jsx`, photoshopFile);
})();
