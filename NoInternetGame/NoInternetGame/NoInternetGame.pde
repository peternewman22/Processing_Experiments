int xoffset, yoffset;
PVector loc, vel, acc;


void setup() {
  size(1500, 1000);
  xoffset = width/8;
  yoffset = height/10;
  loc = new PVector(xoffset + 20, height/2);
  vel = new PVector(0, 0);
  acc = new PVector(0, 0);
  rectMode(CENTER);
}

void draw() {
  background(0);
  stroke(255);
  strokeWeight(2);
  line(xoffset, height/2+yoffset, width - xoffset, height/2 + yoffset);
  fill(255);

  update();
  rect(loc.x, loc.y, 20, yoffset*2);
}

void keyPressed() {
  if ((key == 32)&&(loc.y == height/2)) { //if it's on the ground
    vel = new PVector(0, -10);
  }
}

void applyGravity() {
  if (loc.y > height/2) {
    acc = new PVector(0, 0.1);
 }
}

void update() {
  //applyGravity();
  vel.add(acc);
  loc.add(vel);
  acc.mult(0);
  if (loc.y < height/2) {
    loc.y = height/2;
  }
}
