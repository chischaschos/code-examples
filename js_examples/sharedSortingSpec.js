var utils = require('./utils');

module.exports = function(name, context) {
  it (name + ' sorts small sets', function() {
    var sorted = context.sort([]);
    expect(sorted).toEqual([]);

    sorted = context.sort([ 1 ]);
    expect(sorted).toEqual([ 1 ]);

    sorted = context.sort([ 3, 1 ]);
    expect(sorted).toEqual([ 1, 3 ]);

    sorted = context.sort([ 9, 2, 3 ,1, 0 ]);
    expect(sorted).toEqual([ 0, 1, 2, 3, 9 ]);

    sorted = context.sort([ 9, 1, 3 ,1, 0 ]);
    expect(sorted).toEqual([ 0, 1, 1, 3, 9 ]);

    sorted = context.sort([ 2, 1, 3 ,1, 0 ]);
    expect(sorted).toEqual([ 0, 1, 1, 2, 3 ]);
  });

  it (name + ' sorts bigger random numbers sets', function() {
    var elementsNumber = 1000;
    var bigArray = utils.shuffle(utils.createArray(elementsNumber));

    var startTime = new Date;
    context.sort(bigArray);
    var endTime = new Date;
    console.log(' [x] Sorting ' + elementsNumber + ' random numbers with ' + name + ' in ' + (endTime - startTime) / 1000 + ' secs');

    expect(utils.isSorted(bigArray)).toBeTruthy();
  });

  it (name + ' sorts partially ascending ordered sets', function() {
    var bigArray = [];
    for (var index = 0; index < 5000; index++) {
      bigArray.push(index);
    }

    bigArray = bigArray.concat(utils.shuffle(utils.createArray(10000)));

    var startTime = new Date;
    context.sort(bigArray);
    var endTime = new Date;
    console.log(' [x] Sorting ' + bigArray.length + ' partially ascending numbers with ' + name + ' in ' + (endTime - startTime) / 1000 + ' secs');

    expect(utils.isSorted(bigArray)).toBeTruthy();
  });

  it (name + ' sorts descending sets', function() {
    var bigArray = [];
    for (var index = 5000; index > 0; index--) {
      bigArray.push(index);
    }

    var startTime = new Date;
    context.sort(bigArray);
    var endTime = new Date;
    console.log(' [x] Sorting ' + bigArray.length + ' descending sets with ' + name + ' in ' + (endTime - startTime) / 1000 + ' secs');

    expect(utils.isSorted(bigArray)).toBeTruthy();
  });

}
