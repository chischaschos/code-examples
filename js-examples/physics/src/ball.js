export default class Ball {
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
    if (this.box.nearToVerticalWall(this)) {
      this.yDirectionIncrement *= -1;
    }

    if (this.box.nearToHorizontalWall(this)) {
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
