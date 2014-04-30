var utils = require('./utils')

describe ('utils', function() {
  it ('should shuffle', function() {
    var shuffledArray = utils.shuffle([ 1, 2 ]);
    expect(shuffledArray).toContain(1);
    expect(shuffledArray).toContain(2);
    expect(shuffledArray.length).toBe(2);

    shuffledArray = utils.shuffle([ 1 ]);
    expect(shuffledArray).toContain(1);
    expect(shuffledArray.length).toBe(1);

    shuffledArray = utils.shuffle([]);
    expect(shuffledArray.length).toBe(0);
  });

  it ('should create an array', function() {
    var createdArray = utils.createArray(4);
    expect(createdArray).toEqual([ 0, 1, 2, 3 ]);
  });

  it ('should validate if an array isSorted', function() {
    var createdArray = utils.createArray(4);
    expect(utils.isSorted(createdArray)).toBeTruthy();
    expect(utils.isSorted([ 9, 1 ])).toBeFalsy();
  });
});
