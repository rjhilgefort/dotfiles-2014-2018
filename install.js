#!/usr/bin/env node

var shell = require('shelljs'),
    program = require('commander'),
    _ = require('lodash'),
    colors = require('colors'),
    inquirer = require('inquirer');

var source, dest, projectFiles, special, blacklist, existingLink;

program
    .version('0.0.1')
    .usage("[options]")
    .parse(process.argv);

existingLink = {
    type: 'list',
    name: 'existingLink',
    message: "A non-linked file/directory already exists at the following, what would you like to do?",
    choices: [
        "Skip it, I'll deal with it later",
        "Move existing to `__<name>` and write new link.",
        "Overwrite it, I give zero f**ks about what's already there."
    ]
}

// Make sure submodules are installed
// shell.exec('git submodule update --init --recursive');


///////////////////////////////////////////////////////////////////////////////
// Link base16-vim schemes to .vim dir
///////////////////////////////////////////////////////////////////////////////

if (false) {
	source = __dirname + '/.src/base16-vim/colors/';
	dest = __dirname + '/.vim/colors/';

	_.forEach(shell.ls(source), function(scheme) {
		shell.ln('-sf', source + scheme, dest + scheme);
	});
}

///////////////////////////////////////////////////////////////////////////////
// .prezto prompt installs
///////////////////////////////////////////////////////////////////////////////

source = __dirname + '/.zprezto/modules/prompt/external/';
dest = __dirname + '/.zprezto/modules/prompt/functions/';

/*
// TODO: This would be ideal, but we'll just hardcode the installs for now
shell.ls(source).forEach(function(repo) {
	repo = source + repo;
});
*/

// pure
// shell.ln('-sf', source + 'pure/pure.zsh', dest + 'prompt_pure_setup');


///////////////////////////////////////////////////////////////////////////////
// Link items at root of dotfiles project
///////////////////////////////////////////////////////////////////////////////

shell.cd(__dirname);

projectFiles = [
	'.git', '.gitignore', '.gitmodules', 'TODO.md',
	'install.js', 'node_modules', 'package.json'
];
special = ['.karabiner', '.spacemacs'];
blacklist = _.union(projectFiles, special);

_.forEach(shell.ls('-A'), function(toLink) {
    var newHome = shell.env.HOME + "/" + toLink,
        eachExistingLink;

	// skip iteration if in blacklist
	if (_.contains(blacklist, toLink)) return true;

    // Go ahead and link if nothing exists at `newHome`
    if (!shell.test('-e', newHome)) {
        shell.ln('-sf', toLink, newHome);
        return true;
    }

    // Handle existing `newHome` locations
    eachExistingLink = _.clone(existingLink);
    eachExistingLink.message += (" " + newHome).red;

    inquirer.prompt(eachExistingLink, function(response) {
        shell.echo(response);
        shell.exit(1);
    });
});


///////////////////////////////////////////////////////////////////////////////
// Handle special configuration items
///////////////////////////////////////////////////////////////////////////////

shell.cd(__dirname);

// Link Karabiner config xml
karabinerDir = shell.env.HOME + "/Library/Application\ Support/Karabiner";
if (shell.test('-d', karabinerDir)) {
	shell.ln('-sf', ".karabiner/private.xml", karabinerDir + "/private.xml");
}

// Link spacemacs
shell.ln('-sf', ".spacemacs/.spacemacs", shell.env.HOME + "/.spacemacs");
shell.ln('-sf', ".spacemacs/rjhilgefort", shell.env.HOME + "/.emacs.d/private/rjhilgefort");
shell.ln('-sf', ".spacemacs/rjhilgefort/.mc-lists.el", shell.env.HOME + "/.emacs.d/.mc-lists.el");


///////////////////////////////////////////////////////////////////////////////
// Other commands that need to be run
///////////////////////////////////////////////////////////////////////////////

// Make sure we're using zsh
shell.exec('chsh -s /bin/zsh');
