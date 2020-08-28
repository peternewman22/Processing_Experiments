class Body {
  float r;
  float m;
  color col;
  PVector pos;
  PVector vel;
  PVector acc;
  int ix;


  Body(int ix_, float r_, PVector pos_, PVector vel_, float m_, color col_) {
    ix = ix_;
    r = r_;
    pos = pos_.copy();
    m = m_;
    col = col_;
    vel = vel_.copy();
    acc = new PVector(0, 0);
  }

  PVector attract(Body[] bodies) {
    PVector fFinal = new PVector(0, 0);
    for (int i = 0; i < bodies.length; i++) {
      if (i != ix) { //don't attract to self... d is 0 at that point though...
        float d = pos.dist(bodies[i].pos);
        PVector f = PVector.sub(pos, bodies[i].pos); //vector from pos to the other body
        f.normalize(); // make it a unit vector
        f.mult((-G*m*bodies[i].m)/pow(d, 2)); // scale it by the gravitational constant
        fFinal.add(f);
      }
    }
    return fFinal;
  }

  void applyForce(PVector f) {
    f.div(m); // take the force and divide by m to get a
    acc.add(f);
  }

  void update() {
    applyForce(attract(system.bodies));
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }

  void show() {
    noStroke();
    fill(col);
    ellipse(pos.x, pos.y, r, r);
  }
}
