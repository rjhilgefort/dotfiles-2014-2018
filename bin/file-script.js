#!/usr/bin/env node

// Declare common vars
var s, _;

s = require('shelljs');
_ = require('lodash');

s.cd('/Volumes/Home/Applications/_Tested');

_.forEach(s.ls(), function(value, index) {
	if (/^\(/.test(value)) {
		before = value;
		after = value;

		after = after.replace(/\(/g, '');
		after = after.replace(/\)/g, '');
		after = after.replace(/\s/g, '');
		after = after.trim();

		s.mv(before, after);
	}
});

// s.echo('\n');
// s.echo(s.ls());
