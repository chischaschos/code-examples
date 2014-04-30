module.exports = function sort(elements) {
  for (var index = 0; index < elements.length; index++) {

    for (var firstInSet = index + 1; firstInSet < elements.length; firstInSet++) {
      var currentInSet = elements[firstInSet];
      var currentElement = elements[index];

      if (currentElement > currentInSet) {
        elements[index] = currentInSet;
        elements[firstInSet] = currentElement;
      }
    }
  };
  return elements;
};
