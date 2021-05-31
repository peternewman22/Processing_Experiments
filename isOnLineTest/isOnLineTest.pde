/*
My Reversi method involves detecting if a point lies on a line...
 In exact number land that's fine, but I don't know how that's going to go in pixel land
 
 Answer: do a perpendicular projection of the mouse vector onto the line
 When the distance between that point and the mouse itself < threshold,
 THEN we're on the line =)
 */

PVector start, end, mouse, segment, normSegment,projPoint;
float d;
boolean isOnLine = false;
float m;

void setup() {
  size(700, 700);
  start = new PVector(100, 100);
  end = new PVector(600, 600);
  mouse = new PVector(0, 0);
  segment = PVector.sub(end, start);
  normSegment = segment.normalize();
  projPoint = new PVector(0, 0);
  d = 0;
}

void draw() {
  background(0);
  mouse.set(mouseX, mouseY);
  stroke(255);
  strokeWeight(10);
  point(start.x, start.y);
  point(end.x, end.y);
  strokeWeight(2);
  line(start.x, start.y, end.x, end.y);
  findProjectionPoint();
  ellipse(projPoint.x, projPoint.y,10,10);
  checkIfOnLine();
  if (!isOnLine) {
    fill(255, 0, 0);
  } else {
    fill(0, 255, 0);
  }
  noStroke();
  ellipse(mouse.x, mouse.y, 20, 20);
}

void findProjectionPoint(){
  PVector ap = PVector.sub(mouse,start);
  PVector ab = normSegment.copy();
  ab.mult(ap.dot(ab));
  projPoint.set(PVector.add(start,ab));
  d = PVector.dist(mouse,projPoint);
}


void checkIfOnLine() {
  // find the gradient
  isOnLine = d < 5;
  
  //m = (end.y - start.y)/(end.x - start.x);
  //if (mouse.y - start.y == m*(mouse.x - start.x)) {
  //  isOnLine = true;
  //} else {
  //  isOnLine = false;
  //}
}
