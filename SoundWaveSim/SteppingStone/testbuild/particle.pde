class Particle {
  PVector loc, vel, acc, anchor;
  float size, mass, k;
  Particle(PVector loc_) {
    anchor = loc_;
    loc = anchor.copy();
    size = 100;
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = 5;
    k = 0.01;
  }

  void show() {
    fill(255);
    ellipse(loc.x, loc.y, size, size);
  }

  void update() {
    applyForce(springForce());
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    vel.mult(0.95); //dampening
  }

  void applyForce(PVector f) {
    PVector force = PVector.div(f, mass);
    acc.add(force);
  }

  PVector springForce() {
    //spring force proportional to the distance from the anchor
    float d = anchor.dist(loc);
    PVector springForce = PVector.sub(anchor, loc);
    springForce.normalize();
    springForce.mult(k*d);
    return springForce;
  }
}
