#!/usr/bin/env node
require('shelljs');

// Declare common vars
var source, dest;


///////////////////////////////////////////////////////////////////////////////
// Link base16-vim schemes to .vim dir
///////////////////////////////////////////////////////////////////////////////

if (false) {
	source = __dirname + '/.src/base16-vim/colors/';
	dest = __dirname + '/.vim/colors/';

	ls(source).forEach(function(scheme) {
		ln('-sf', source + scheme, dest + scheme);
	});
}

///////////////////////////////////////////////////////////////////////////////
// .prezto prompt installs
///////////////////////////////////////////////////////////////////////////////

source = __dirname + '/.zprezto/modules/prompt/external/';
dest = __dirname + '/.zprezto/modules/prompt/functions/';

/*
// TODO: This would be ideal, but we'll just hardcode the installs for now
ls(source).forEach(function(repo) {
	repo = source + repo;

});
*/

// pure
ln('-sf', source + 'pure/pure.zsh', dest + 'prompt_pure_setup');


///////////////////////////////////////////////////////////////////////////////
// Link items at root of dotfiles project
///////////////////////////////////////////////////////////////////////////////

cd(__dirname);

var blacklist = [
	".git",
	".gitignore",
	".gitmodules",
	"TODO.md",
	"install.js"
];

ls('-A').forEach(function(toLink) {
	if (!~blacklist.indexOf(toLink)) {
		ln('-sf', toLink, env['HOME'] + "/" + toLink);
	}
});

