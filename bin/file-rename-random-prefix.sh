#!/usr/bin/env node

var s = require('shelljs');
var _ = require('lodash');

var files, generateNumbersArray, generateRandomNumbersArray, randomArray,
    before, after;

/**
 * @param {Number} length: Number of elements in array
 * @return {Array}         Resulting array of incremental numbers to `length`
 */
generateNumbersArray = function(length) {
    var ret;

    ret = [];
    for (i = 0; i < length; i++) {
        ret.push(i.toString());
    }

    return ret;
};

/**
 * @param {Number} length: Number of elements in array
 * @return {Array}         Resulting array
 */
generateRandomNumbersArray = function(length) {
    var ret, ordered, randomIndex;

    ret = [];
    ordered = generateNumbersArray(length);

    while (ret.length !== length) {
        randomIndex = _.random(ordered.length - 1);
        ret.push(_.pullAt(ordered, randomIndex));
    }

    // error check result
    if (!_.isEmpty(ordered)) {
        console.log('ordered is not empty');
        // console.log('ordered', ordered);
        console.log('ordered.length', ordered.length);
    }

    return ret;
};


s.cd('/Users/rjhilgefort/Pictures/60Soiree');

files = s.ls();
randomArray = generateRandomNumbersArray(files.length);

_.forEach(files, function(file, i) {
    before = file;
    after = file;

    after = _.padLeft(randomArray[i], 3, "0") + "_60Soiree-" + _.padLeft(i, 3, "0") + ".jpg";

    s.mv(before, after);
});

// s.echo('\n');
// s.echo(s.ls());
