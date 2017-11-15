class Box {
  constructor(ctx) {
    this.ctx = ctx;
    this.topLimit = 10;
    this.bottomLimit = 400;
    this.leftLimit = 10;
    this.rightLimit = 400;
  }

  render() {
    this.ctx.rect(this.leftLimit, this.topLimit, this.rightLimit, this.bottomLimit);
    this.ctx.stroke();
  }

  // object's origin is not the same as the box origin
  nearToVerticalWall(object) {
    return this.bottomLimit <= object.y || this.topLimit >= object.y - this.topLimit;
  }

  // object's origin is not the same as the box origin
  nearToHorizontalWall(object) {
    return this.rightLimit <= object.x || this.leftLimit >= object.x - this.leftLimit;
  }

  clear() {
    this.ctx.clearRect(this.leftLimit, this.topLimit, this.rightLimit, this.bottomLimit);
  }
}

class Ball {
  constructor(ctx, {x, y, xDirection, yDirection, box}) {
    this.ctx = ctx
    this.x = x;
    this.y = y;
    this.r = 10;
    this.increment = 5;
    this.xDirectionIncrement = this.increment * xDirection;
    this.yDirectionIncrement = this.increment * yDirection;
    this.box = box;
  }

  render() {
    if (box.nearToVerticalWall(this)) {
      this.yDirectionIncrement *= -1;
    }

    if (box.nearToHorizontalWall(this)) {
      this.xDirectionIncrement *= -1;
    }

    this.x += this.xDirectionIncrement;
    this.y += this.yDirectionIncrement;

    this.ctx.strokeStyle = 'black';
    this.ctx.beginPath();
    this.ctx.arc(this.x, this.y, this.r, 0, 2 * Math.PI);
    this.ctx.stroke();
    this.ctx.fill();
    this.ctx.closePath();
  }
}

function frame(timestamp) {
  if (!previousTimestamp) previousTimestamp = timestamp;

  if (timestamp - previousTimestamp >= 16) {
    box.clear();

    balls.forEach(ball => {
      ball.render();
    });

    previousTimestamp = timestamp;
  }

  requestAnimationFrame(frame);
}

// create objects
let canvas = document.querySelector("canvas");
let ctx = canvas.getContext("2d");
let box = new Box(ctx);
let balls = [ new Ball(ctx, {
  box,
  x: Math.random() * (box.bottomLimit - box.topLimit) + box.topLimit,
  y: Math.random() * (box.rightLimit - box.leftLimit) + box.leftLimit,
  xDirection: [-1, 1][Math.round(Math.random())],
  yDirection: [-1, 1][Math.round(Math.random())],
}) ];
let previousTimestamp = null;

// start animation
box.render();
requestAnimationFrame(frame);
