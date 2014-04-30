var utils = require('./utils');

module.exports.sort = function sort(elements) {
  for (var index = 0; index < elements.length; index++) {

    var smallerIndex = index;

    for (var firstInSet = index + 1; firstInSet < elements.length; firstInSet++) {
      if (utils.isLess(elements, firstInSet, smallerIndex)) {
        smallerIndex = firstInSet;
      }
    }

    utils.exchange(elements, index, smallerIndex);
  };

  return elements;
};
