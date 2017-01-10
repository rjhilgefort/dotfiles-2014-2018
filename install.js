#!/usr/bin/env node

// TODO: Refactor all the way to Ramda, remove lodash
const S = require('shelljs');
const R = require('Ramda');
const _ = require('lodash');
const program = require('commander');
const chalk = require('chalk');

const RE = require('./_lib/ramda-extras');

// TODO:
// - Add verbose option, and flag
// - Refactor from a blacklist, to a whitelist

program
  .version('0.0.2')
  .usage("[options]")
  .option("-e, --existing [skip]", "Handle existing directories as overwrite/move/[skip]", 'skip')
  .option("-u, --update", 'Update submodules before installing')
  .option("-s, --silent", 'Turn off logging')
  .parse(process.argv);


///////////////////////////////////////////////////////////////////////////////
// Util methods / Overrides
///////////////////////////////////////////////////////////////////////////////

const echoSection = R.pipe(
  RE.pad(' '),
  RE.pad('###'),
  RE.padLeft('\n\n'),
  chalk.bold.bgGreen.black,
  S.echo
);


///////////////////////////////////////////////////////////////////////////////
// Handle options
///////////////////////////////////////////////////////////////////////////////

// Handle: `existing`
// Default to 'move' if nothing was specified
if (!_.includes(['overwrite', 'move', 'skip'], program.existing)) {
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
      R.pipe(
        chalk.bold.red,
        R.prepend
      )('==>'),
      R.join(' '),
      S.echo
    )(args);

    return fn(...args);
  };

  // TODO: Don't use `wrap`:
  // http://stackoverflow.com/questions/41204219/ramda-how-to-modify-function-parameters-without-r-wrap/41210224
  S.exec = R.wrap(S.exec, makeVerbose(''));
  S.ln = R.wrap(S.ln, makeVerbose('ln'));
  S.rm = R.wrap(S.rm, makeVerbose('rm'));
  S.mv = R.wrap(S.mv, makeVerbose('mv'));
}


///////////////////////////////////////////////////////////////////////////////
echoSection('Make sure submodules are installed');
///////////////////////////////////////////////////////////////////////////////

(() => {
  if (!program.update) return S.echo('Skipping. Use `-u` flag to do so.');
  S.exec('git submodule update --init --recursive');
})();

///////////////////////////////////////////////////////////////////////////////
echoSection('Link base16-vim schemes to .vim dir');
///////////////////////////////////////////////////////////////////////////////

(() => {
  return S.echo('Skipping. TODO: Decide what to do with this.');

  let source = `${__dirname}/.src/base16-vim/colors`;
  let dest = `${__dirname}/.vim/colors`;

  _.forEach(S.ls(source), (scheme) => {
    S.ln('-sf', `${source}/${scheme}`, `${dest}/${scheme}`);
  });
})();


///////////////////////////////////////////////////////////////////////////////
echoSection('.prezto prompt installs');
///////////////////////////////////////////////////////////////////////////////
// TODO: Loop over all prompts in `source` and link. Hardcode the installs for now...

(() => {
  return S.echo('Skipping. TODO: Make sure this works...');

  let source = `${__dirname}/.zprezto/modules/prompt/external`;
  let dest = `${__dirname}/.zprezto/modules/prompt/functions`;

  // Pure
  S.ln('-sf', `${source}/pure/pure.zsh`, `${dest}/prompt_pure_setup`);
})();


///////////////////////////////////////////////////////////////////////////////
echoSection('Link items at root of dotfiles project');
///////////////////////////////////////////////////////////////////////////////

(() => {
  let dest;
  let projectFiles = [
    '.git', '.gitignore', '.gitmodules', 'TODO.md', 'README.md',
    'install.js', 'node_modules', 'package.json', 'npm-debug.log',
    '.DS_Store', '_lib'
  ];
  let special = ['.spacemacs', '.adobe_photoshop'];
  let blacklist = _.union(projectFiles, special);

  _.forEach(S.ls('-A', __dirname), (nodeName) => {
    // Skip iteration if in blacklist
    if (_.includes(blacklist, nodeName)) return true;

    dest = `${S.env.HOME}/${nodeName}`;

    // Handle existing `dest` directories
    if (S.test('-e', dest)) {
      S.echo(`Existing target found, ${program.existing} applied to: ${dest}`);

      switch (program.existing) {
        case 'overwrite':
          S.rm('-r', dest);
          break;
        case 'move':
          S.mv('-f', dest, `${dest}__`);
          break;
        case 'skip':
          return true;
          break;
      }
    }

    let source = `${__dirname}/${nodeName}`;
    S.ln('-sf', source, dest);
  });
})();


///////////////////////////////////////////////////////////////////////////////
echoSection('Handle Special: Spacemacs');
///////////////////////////////////////////////////////////////////////////////
// TODO: Make `ln` function that respects conflict directive (like in above loop)

(() => {
  S.ln('-sf', `${__dirname}/.spacemacs/.spacemacs`,               `${S.env.HOME}/.spacemacs`);
  S.ln('-sf', `${__dirname}/.spacemacs/rjhilgefort`,              `${S.env.HOME}/.emacs.d/private/rjhilgefort`);
  S.ln('-sf', `${__dirname}/.spacemacs/rjhilgefort/.mc-lists.el`, `${S.env.HOME}/.emacs.d/.mc-lists.el`);
})();


///////////////////////////////////////////////////////////////////////////////
echoSection('Handle Special: Adobe Photoshop Scripts');
///////////////////////////////////////////////////////////////////////////////
// TODO: Make method out of the special pattern
// TODO: loop over dotfiles photoshop directory and link all

(() => {
  const photoshopDir = "/Applications/Adobe Photoshop CS6/Presets/Scripts";
  const photoshopFile =  + `${photoshopDir}/BatchCropAndStriaghten.jsx`;
  if (!S.test('-d', photoshopDir)) return;

  // Move whatever is there, besides symlink
  if (S.test('-e', photoshopFile) && !S.test('-L', photoshopFile)) {
    S.mv(photoshopFile, `${photoshopFile}_save`);
  }

  // Link only if it's still not a symlink
  if (S.test('-L', photoshopFile)) return;

  S.ln('-sf', `${__dirname}/.adobe_photoshop/BatchCropAndStriaghten.jsx`, photoshopFile);
})();
