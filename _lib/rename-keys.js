const R = require('Ramda');

const renameKeys =
  R.curry(
    (keysMap, obj) =>
      R.reduce(
        (acc, key) => R.assoc(keysMap[key] || key, obj[key], acc),
        {},
        R.keys(obj)
      )
  )

module.exports = renameKeys;
