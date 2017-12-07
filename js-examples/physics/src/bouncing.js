var canvas = document.querySelector('canvas');
var context = canvas.getContext('2d');
var radius = 20;
var g = 0.1;
var x = 50;
var y = 50;
var vx = 2;
var vy = 0;

function drawBall() {
  context.clearRect(0, 0, canvas.width, canvas.height);
  context.beginPath();
  context.arc(x, y, radius, 0, 2*Math.PI, true);
  context.closePath();
  context.fill();
}

function onEachStep() {
  vy += g; // gravity increases the vertical speed
  x += vx; // horizontal speed increases horizontal position
  y += vy; // vertical speed increases vertical position

  if (y > canvas.height - radius){ // if ball hits the ground
    y = canvas.height - radius; // reposition it at the ground
    vy *= -0.8; // then reverse and reduce its vertical speed
  }

  if (x > canvas.width + radius){ // if ball goes beyond canvas
    x = -radius; // wrap it around
  }

  drawBall();
};

export default function() {
  setInterval(onEachStep, 1000/60);
};
