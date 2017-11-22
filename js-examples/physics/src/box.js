export default class Box {
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
