var utils = require('./utils');

module.exports.sort = function sort(elements) {

  for (var index = 0; index < elements.length; index++) {
    for (var limit = index; limit > 0 && utils.isLess(elements, limit, limit - 1); limit--) {
      utils.exchange(elements, limit, limit - 1);
    }
  }

  return elements;
}
