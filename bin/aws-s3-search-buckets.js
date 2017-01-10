#!/usr/bin/env node

const S = require('../_lib/shelljs');
const R = require('ramda');

const parseBucketsFromS3list = R.pipe(
  R.split('\n'),
  R.dropLast(1),    // Remove trailing blank entry
  R.map(R.drop(20)) // Clean timestamps, so just file name is left
);

R.pipe(
  parseBucketsFromS3list,
  // TODO: Recursively search each bucket
  console.dir
)(S.exec('aws s3 ls'));
