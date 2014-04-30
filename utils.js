var random = function random(max) {
  return Math.round(Math.random() * max);
}

var shuffle = function(elements) {
  for (var index = 0; index < elements.length; index++) {
    var myRandom = random(index);
    var currentElement = elements[index];
    var currentRandom = elements[myRandom];

    elements[index] = currentRandom;
    elements[myRandom] = currentElement;
  }

  return elements;
}

var createArray = function(size) {
  var createdArray = [];

  for (var index = 0; index < size; index++) {
    createdArray.push(index);
  }

  return createdArray;
};

var isSorted = function(elements) {
  var result = true;

  for (index = 0; index < elements.length - 1; index++) {
    if (elements[index + 1] !== undefined && elements[index] > elements[index + 1]) {
      result = false;
      break;
    }
  }

  return result;
};

var exchange = function(elements, from, to) {
  var fromElement = elements[from];
  var toElement = elements[to];

  elements[to] = fromElement;
  elements[from] = toElement;
};

var isLess = function(elements, base, versus) {
  return elements[base] < elements[versus];
}

module.exports.random = random;
module.exports.shuffle = shuffle;
module.exports.createArray = createArray;
module.exports.isSorted = isSorted;
module.exports.exchange = exchange;
module.exports.isLess = isLess;

