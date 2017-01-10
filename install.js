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
  .option("-e, --existing [move]", "Handle existing directories as overwrite/[move]/skip", 'move')
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

  S.exec = R.wrap(S.exec, makeVerbose(''));
  S.ln = R.wrap(S.ln, makeVerbose('ln'));
  S.rm = R.wrap(S.rm, makeVerbose('rm'));
  S.mv = R.wrap(S.mv, makeVerbose('mv'));
}

// Placeholder variable for all sections
let source, dest;


///////////////////////////////////////////////////////////////////////////////
echoSection('Make sure submodules are installed');
///////////////////////////////////////////////////////////////////////////////

(() => {
  if (!program.update) return S.echo('Skipping. Use `-u` flag to do so.');
  S.exec('git submodule update --init --recursive');
})()

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
})()


///////////////////////////////////////////////////////////////////////////////
// echoSection('.prezto prompt installs');
///////////////////////////////////////////////////////////////////////////////

// source = __dirname + '/.zprezto/modules/prompt/external';
// dest = __dirname + '/.zprezto/modules/prompt/functions';

/*
// TODO: This would be ideal, but we'll just hardcode the installs for now
S.ls(source).forEach(function(repo) {
  repo = source + repo;
});
*/

// pure
// S.ln('-sf', `${source}/pure/pure.zsh`, `${dest}/prompt_pure_setup`);


///////////////////////////////////////////////////////////////////////////////
echoSection('Link items at root of dotfiles project');
///////////////////////////////////////////////////////////////////////////////

let projectFiles = [
  '.git', '.gitignore', '.gitmodules', 'TODO.md', 'README.md',
  'install.js', 'node_modules', 'package.json', 'npm-debug.log',
  '.DS_Store', '_lib'
];
let special = ['.karabiner', '.spacemacs'];
let blacklist = _.union(projectFiles, special);

S.cd(__dirname);

_.forEach(S.ls('-A'), (nodeName) => {
  // Skip iteration if in blacklist
  if (_.includes(blacklist, nodeName)) return true;

  dest = `${S.env.HOME}/${nodeName}`;

  // If it's a symlink, just remove it, regardless of the `existing` param
  if (S.test('-L', dest)) {
    S.rm('-f', dest);
  }

  // Handle existing `dest` directories
  if (S.test('-e', dest)) {
    switch (program.existing) {
      case 'overwrite':
        S.rm('-r', dest);
        break;

      case 'move':
        S.mv('-f', dest, dest + "__");
        break;

      case 'skip':
        break;
    }

    S.echo(`Existing target found, ${program.existing} applied to: ${dest}`);
  }

  source = `${__dirname}/${nodeName}`;
  S.ln('-sf', source, dest);
});

process.exit(1);

///////////////////////////////////////////////////////////////////////////////
// Handle special configuration items
///////////////////////////////////////////////////////////////////////////////
// TODO: Make function out of the special pattern

S.cd(__dirname);

// Link spacemacs
S.ln('-sf', `${__dirname}/.spacemacs/.spacemacs`,               `${S.env.HOME}/.spacemacs`);
S.ln('-sf', `${__dirname}/.spacemacs/rjhilgefort`,              `${S.env.HOME}/.emacs.d/private/rjhilgefort`);
S.ln('-sf', `${__dirname}/.spacemacs/rjhilgefort/.mc-lists.el`, `${S.env.HOME}/.emacs.d/.mc-lists.el`);

// Link Karabiner config xml
karabinerDir = `${S.env.HOME}/Library/Application\ Support/Karabiner`;
karabinerFile = `${karabinerDir}/private.xml`;
if (S.test('-d', karabinerDir)) {
  // Move whatever is there, besides symlink
  if (S.test('-e', karabinerFile) && !S.test('-L', karabinerFile)) {
    S.mv(karabinerFile, karabinerFile + "_save");
  }
  // Link only if it's still not a symlink
  if (!S.test('-L', karabinerFile)) {
    S.ln('-sf', karabinerFile, `${__dirname}/.karabiner/private.xml`);
  }
}

// Link adobe scripts if installed
// TODO: loop over dotfiles photoshop directory and link all
photoshopDir = "/Applications/Adobe Photoshop CS6/Presets/Scripts";
photoshopFile = photoshopDir + "/BatchCropAndStriaghten.jsx";
if (S.test('-d', photoshopDir)) {
  // Move whatever is there, besides symlink
  if (S.test('-e', photoshopFile) && !S.test('-L', photoshopFile)) {
    S.mv(photoshopFile, photoshopFile + "_save");
  }
  // Link only if it's still not a symlink
  if (!S.test('-L', photoshopFile)) {
    S.ln('-sf', photoshopFile, `${__dirname}/.adobe_photoshop/BatchCropAndStriaghten.jsx`);
  }
}

///////////////////////////////////////////////////////////////////////////////
// Other commands that need to be run
///////////////////////////////////////////////////////////////////////////////

// Make sure we're using zsh
// TODO: Only do this if not zsh
S.exec('chsh -s /bin/zsh');
