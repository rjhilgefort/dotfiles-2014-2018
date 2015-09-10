#!/usr/bin/env node

var shell = require('shelljs'),
	_ = require('lodash');

var source, dest;


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

var projectFiles = [
	'.git', '.gitignore', '.gitmodules', 'TODO.md',
	'install.js', 'node_modules', 'package.json'
];

var special = ['.karabiner', '.spacemacs'];

var blacklist = _.union(projectFiles, special);

_.forEach(shell.ls('-A'), function(toLink) {
	// skip iteration if in blacklist
	if (_.contains(blacklist, toLink)) return true;

	shell.ln('-sf', toLink, shell.env.HOME + "/" + toLink);
});


///////////////////////////////////////////////////////////////////////////////
// Handle special configuration items
///////////////////////////////////////////////////////////////////////////////

shell.cd(__dirname);

// Link Karabiner config xml
shell.ln('-sf', ".karabiner/private.xml", shell.env.HOME + "/Library/Application\ Support/Karabiner/private.xml");

// Link spacemacs
shell.ln('-sf', ".spacemacs/.spacemacs", shell.env.HOME + "/.spacemacs");
shell.ln('-sf', ".spacemacs/rjhilgefort", shell.env.HOME + "/.emacs.d/private/rjhilgefort");
shell.ln('-sf', ".spacemacs/rjhilgefort/.mc-lists.el", shell.env.HOME + "/.emacs.d/.mc-lists.el");


///////////////////////////////////////////////////////////////////////////////
// Other commands that need to be run
///////////////////////////////////////////////////////////////////////////////

// Make sure we're using zsh
shell.exec('chsh -s /bin/zsh');
