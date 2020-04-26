class Mover {
  float mass, size;
  PVector loc, vel, acc;

  Mover(float mass_, PVector loc_, PVector vel_, float size_) {
    mass = mass_;
    loc = loc_.copy();
    vel = vel_.copy();
    acc = new PVector(0, 0);
    size = size_;
  }

  void applyForce(PVector f) {
    acc.add(f);
    acc.div(mass);
  }

  void update() {
    loc.add(vel);
    vel.add(acc);
    acc.mult(0);
  }

  void show() {
    fill(255);
    noStroke();
    ellipse(loc.x, loc.y, size, size);
  }
}
