var x = 100,
  y = 100,
  angle1 = 0.0,
  segLength = 50;

function setup() {
  // find the size of the underlying div
  var divWidth = $("#setup_p5_sketch").width();
  var divHeight = $("#setup_p5_sketch").height();
  var myCanvas = createCanvas(divWidth, divHeight);
  myCanvas.parent('setup_p5_sketch');
  strokeWeight(20.0);
  stroke(0, 100);
}

function draw() {
  background(255);
  var dx = mouseX - x;
  var dy = mouseY - y;
  angle1 = atan2(dy, dx);
  x = mouseX - (cos(angle1) * segLength);
  y = mouseY - (sin(angle1) * segLength);
  fill(255);
  segment(x, y, angle1);
  fill(0);
  ellipse(x, y, 20, 20);
}

function segment(x, y, a) {
  push();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  pop();
}

// when the window is resized the canvas is resized accordingly
function windowResized(){
  var divWidth = $("#setup_p5_sketch").width();
  var divHeight = $("#setup_p5_sketch").height();
  resizeCanvas(divWidth, divHeight);
}
