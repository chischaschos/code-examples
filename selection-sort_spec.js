var utils = require('./utils');
var sort = require('./selection-sort');

describe('selection sort', function() {
  it ('sorts', function() {
    var sorted = sort([]);
    expect(sorted).toEqual([]);

    sorted = sort([ 1 ]);
    expect(sorted).toEqual([ 1 ]);

    sorted = sort([ 3, 1 ]);
    expect(sorted).toEqual([ 1, 3 ]);

    sorted = sort([ 9, 1, 3 ,1, 0 ]);
    expect(sorted).toEqual([ 0, 1, 1, 3, 9 ]);

    var bigArray = utils.shuffle(utils.createArray(20000));
    expect(utils.isSorted(sort(bigArray))).toBeTruthy();
  });
});

