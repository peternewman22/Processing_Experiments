/* This needs to 
 - draw itself
 - applyForce
 - update
 - apply force of rod on the ball
 The path of the rod can only follow a circle.
 The rodforce will just be equal to the component of the weight of the ball in that direction
 
 */

class Weight {
  PVector loc, vel, acc, anchor, gravity;
  float mass, size, rodLength;
  
  Weight() {
    mass = 10;
    size = 50;
    rodLength = 200;
    loc = new PVector(rodLength, -rodLength);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    gravity = new PVector(0, 10);
    anchor = new PVector(0, 0);
  }

  void update() {
    applyForce(gravity);
    applyForce(rodForce(loc, anchor));
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }

  void show() {
    line(anchor.x, anchor.y, loc.x, loc.y);
    ellipse(loc.x, loc.y, size, size);
  }

  void applyForce(PVector f) {
    PVector force = PVector.div(f, mass);
    acc.add(force);
  }

  PVector rodForce(PVector a, PVector b) {
    /* weight force */
    PVector rodForce = PVector.sub(a, b);
    rodForce.normalize();
    rodForce.mult(gravity.dot(rodForce));
    return rodForce;
  }
}
