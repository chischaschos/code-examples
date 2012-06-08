Universe = function(size) {
  this.board = {}

  for(position = 0; position < size * size; position++) {
    this.board[position] = 1;
  }

  //console.log(this.board)

}

Rule1 = function(universe) {
  for(index in universe.board) {
    pointaux = universe.board[index]
    universe.board(new Point(4,4))

  }

}

/*
111
111
111

* */


Point = function(x, y) {
  var x = x;
  var y = y;


}

universe = new Universe(3)
if ((new Rule1 (universe)).board != {
  new Point(0,0): 1, new Point(1,0): 1, new Point(2,0): 1, new Point(1,0): 1, new Point(1,1): 1, new Point(1,2): 1, new Point(2,0): 1, new Point(2,1): 1, new Point(2,2): 1}) {
  console.log("Rule1 not correctly applied")
}
