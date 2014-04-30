var utils = require('./utils');
var sharedSortingExample = require('./sharedSortingSpec');
var selectionSort = require('./selectionSort');
var insertionSort = require('./insertionSort');

describe('Sorting methods', function() {
  sharedSortingExample('selection sort', selectionSort);
  sharedSortingExample('insertion sort', insertionSort);
});

