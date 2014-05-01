var utils = require('./utils');

function partition(elements, loi, hii) {
  if (hii <= loi) return 0;

  var pivotValue = elements[loi];
  utils.exchange(elements, loi, hii);
  var storeIndex = loi;

  for (var leftIndex = loi; leftIndex < hii; leftIndex++) {
    if (elements[leftIndex] <= elements[hii]) {
      utils.exchange(elements, leftIndex, storeIndex);
      storeIndex++;
    }
  }

  utils.exchange(elements, hii, storeIndex);

  return storeIndex;
}

function quickSort(elements, loi, hii) {
  if (hii <= loi) return;
  var partitionIndex = partition(elements, loi, hii);
  quickSort(elements, loi, partitionIndex - 1);
  quickSort(elements, partitionIndex + 1, hii);
}

module.exports.sort = function sort(elements) {
  utils.shuffle(elements);
  quickSort(elements, 0, elements.length - 1);
  return elements;
}

module.exports.partition = partition;
