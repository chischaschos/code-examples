import Box from './box'
import Ball from './ball'

const canvas = document.querySelector("canvas");
const context = canvas.getContext("2d");
const box = new Box(context);
const balls = [];
let previousTimestamp = null;

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

export default function() {
  balls.push(new Ball(context, {
    box,
    x: Math.random() * (box.bottomLimit - box.topLimit) + box.topLimit,
    y: Math.random() * (box.rightLimit - box.leftLimit) + box.leftLimit,
    xDirection: [-1, 1][Math.round(Math.random())],
    yDirection: [-1, 1][Math.round(Math.random())],
  }));

  // start animation
  box.render();
  requestAnimationFrame(frame);
}
