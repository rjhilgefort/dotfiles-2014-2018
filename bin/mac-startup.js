#!/usr/bin/env node

require('shelljs/global');

var _,
	apps, opts, paths, toOpen, toClose,
	byName, hasApp;

_ = require('lodash');

// Paths will be executed in this order
paths = [
	'/System/Library/CoreServices/',
	'/opt/homebrew-cask/Caskroom/',
	'~/Applications/'
];

toOpen = [
	'iTerm',
	'Google Chromee',
	'Finder',
	'Sonos',
	'Messages',
	'Spotify',
	'Simplify',
	'1Password',
	'Clear',
	'Sunrise',
	'Airmail Beta',
	'Dash',
	'Blink1Control'
];

toClose = [
	'iTunes',
	'System Preferences'
];

///////////////////////////////////////////////////////////////////////////////
// DONE WITH CONFIG, DO STUFF!
///////////////////////////////////////////////////////////////////////////////

// Fix paths that leverage '~' to designate home
paths = _.map(paths, function(path) {
	if (/^~/.test(path)) path = path.replace('~', env.HOME);
	return path;
});

hasApp = function(path) {
	if (test('-e', path + this.app)) {
		this.app = path + this.app;
		return false;
	}
	/*
	if (
		find(path).filter(function(file) {
		})[0]
	) {}
	*/
};
toOpen = _.map(toOpen, function(app, i) {
	app = app + '.app';
	this.app = app;

	_.forEach(paths, hasApp, this);

	return (this.app !== app) ? this.app : undefined;
});
toOpen = _.compact(toOpen);

echo(toOpen);

// Open all the things (apps)!
// TODO

// Close all the things (apps)!
// TODO
