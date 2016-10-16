var quickSort = require('./quickSort');

describe ('quick sort helper methods', function() {
  it ('partitions', function() {
    var elements = [];
    expect(quickSort.partition(elements, 0, elements.length - 1)).toEqual(0);
    expect(elements).toEqual([]);

    elements = [ 3, 2 ];
    expect(quickSort.partition(elements, 0, elements.length - 1)).toEqual(1);
    expect(elements).toEqual([ 2, 3 ]);

    elements = [ 1, 4, 0, -1, 3 ];
    expect(quickSort.partition(elements, 0, elements.length - 1)).toEqual(2);
    expect(elements).toEqual([ 0, -1, 1, 4, 3 ]);

    elements = [ 2, 0, 1, 9, 3 ];
    expect(quickSort.partition(elements, 0, elements.length - 1)).toEqual(2);
    expect(elements).toEqual([ 0, 1, 2, 9, 3 ]);
  });
});
