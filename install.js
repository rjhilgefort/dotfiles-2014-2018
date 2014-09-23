#!/usr/bin/env node
require('shelljs/global');

// Make sure we're in script dir
cd(__dirname);

// Link items at root of dotfiles project
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
