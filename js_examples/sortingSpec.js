var utils = require('./utils');
var sharedSortingExample = require('./sharedSortingSpec');
var selectionSort = require('./selectionSort');
var insertionSort = require('./insertionSort');
var shellSort = require('./shellSort');
var quickSort = require('./quickSort');

describe('Sorting methods', function() {
  sharedSortingExample('selection sort', selectionSort);
  sharedSortingExample('insertion sort', insertionSort);
  sharedSortingExample('shell sort', shellSort);
  sharedSortingExample('quick sort', quickSort);
});

