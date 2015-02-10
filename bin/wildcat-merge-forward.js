#!/usr/bin/env node


// TODO:
// - Move to a proper "project" and define a package.json. No more globals
// - Use 'semver' to handle semantic version sorting after getting branches
// - Take path as an argument so this can be applied to any git repo you might have.
// 		Also be flexible enough for others to use (without editing)


// Declare common vars
var shell, _, branches, setupBranch, mergeFrom, silent, output;

shell = require('shelljs');
_ = require('lodash');


// Make sure branch is up to date locally and set stage
setupBranch = function(branch) {
	shell.echo("\n\n\n" + "==> Processing: " + branch + "\n");
	shell.exec('git co ' + branch);
	shell.exec('git pull');
};

// Merge from branch into current
mergeFrom = function(branch) {
	output = shell.exec('git merge ' + branch);

	// Handle conflicts
	if (/CONFLICT/.test(output.output)) {
		shell.exec("git mergetool");
		shell.exec("git add -A");
		shell.exec("git commit --no-edit");
	}

	shell.exec('git push');
};

// Shortcut
silent = { silent: true };

///////////////////////////////////////////////////////////////////////////////
// Start Script
///////////////////////////////////////////////////////////////////////////////

shell.cd(shell.env.HOME + '/Projects/zipscene/wildcat');

// Update remotes
shell.exec('git fetch');

// Get branches
branches = shell.exec('git branches | ag "remotes.*release"', silent);
if (branches.code !== 0) {
	shell.echo("No branches found to merge to/with");
	shell.exit(1);
}

// Parse branches
branches = branches.output;
branches = branches.split('\n');
_.forEach(branches, function(branch, i) {
	branch = branch.trim();
	branch = branch.replace('remotes/origin/', '');
	branches[i] = branch;
});
// Parse out empty strings and anything else that happens to be falsy
branches = _.compact(branches);

// Merge all the found branches
_.forEach(branches, function(branch, i) {
	setupBranch(branch);

	// Skip merge process when processing first
	if (i === 0) return true;

	mergeFrom(branches[(i - 1)]);
});

// Finally, merge into master
setupBranch('master');
mergeFrom(_.last(branches));
