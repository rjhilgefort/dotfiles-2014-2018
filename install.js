#!/usr/bin/env node

// Declare common vars
var shell = require('shelljs'),
	_ = require('lodash'),
	source, dest;

// Make sure submodules are installed
shell.exec('git submodule update --init --recursive');

///////////////////////////////////////////////////////////////////////////////
// Link base16-vim schemes to .vim dir
///////////////////////////////////////////////////////////////////////////////

if (false) {
	source = __dirname + '/.src/base16-vim/colors/';
	dest = __dirname + '/.vim/colors/';

	shell.ls(source).forEach(function(scheme) {
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
shell.ln('-sf', source + 'pure/pure.zsh', dest + 'prompt_pure_setup');


///////////////////////////////////////////////////////////////////////////////
// Link items at root of dotfiles project
///////////////////////////////////////////////////////////////////////////////

shell.cd(__dirname);

var blacklist = [
	".git",
	".gitignore",
	".gitmodules",
	"TODO.md",
	"install.js"
];

shell.ls('-A').forEach(function(toLink) {
	if (!_.contains(blacklist, toLink)) {
		shell.ln('-sf', toLink, shell.env['HOME'] + "/" + toLink);
	}
});

