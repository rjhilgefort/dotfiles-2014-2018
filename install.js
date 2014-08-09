#!/usr/bin/env node
require('shelljs/global');

// make sure we're in script dir
cd(__dirname);


/**
 * Install .zprezto if present
 */
// TODO
/*if (test('-d', ".zprezto")) {
	echo('Installing prezto...');
	cd(".zprezto/runcoms");

	ls().forEach(function(toLink) {
		if (!~["README.md"].indexOf(toLink)) {
			ln('-sf', toLink, "../../." + toLink);
		}
	});
	echo('...done\n');
}*/

// back to script dir
cd(__dirname);


/**
 * Link items at root of dotfiles project
 */
var blacklist = [
	".git",
	"Brewfile",
	"Caskfile",
	"install.js"
];

ls('-A').forEach(function(toLink) {
	if (!~blacklist.indexOf(toLink)) {
		ln('-sf', toLink, env['HOME'] + "/" + toLink);
	}
});
