var utils = require('./utils');

module.exports.sort = function sort(elements) {

  var h = 1;

  while (h < elements.length / 3) h = (h * 3) + 1;

  while (h >= 1) {
    for (var index = h; index < elements.length; index++) {
      for (var limit = index; limit >= h && utils.isLess(elements, limit, limit - h); limit -= h) {
        utils.exchange(elements, limit, limit - h);
      }
    }

    h = Math.round(h / 3);
  };

  return elements;
}
