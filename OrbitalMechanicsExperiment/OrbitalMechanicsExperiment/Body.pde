class Body {
  float mass;
  PVector loc, vel, acc;
  PVector[] projectionPoints;
  float size;
  Boolean animate;
  color col;

  Body(float mass_, PVector loc_, PVector vel_, float size_, color col_) {
    mass = mass_;
    loc = loc_.copy();
    vel = vel_.copy();
    acc = new PVector(0, 0);
    size = size_;
    animate = false;
    col = col_;
  }

  void attract(Body otherBody) {
    // F = -G*m1*m2/r^2
    PVector r = loc.sub(otherBody.loc);
    float rSq = r.magSq();
    if (rSq == 0) {
      //do nothing
      return;
    } else {
      //calculate the magnitude of the force
      float F = bigG*mass*(otherBody.mass)/rSq;
      r.setMag(F);
      applyForce(r);
    }
  }

  void applyForce(PVector f_) {
    PVector f = f_.copy();
    acc.add(f);
    acc.div(mass);
  }

  void updateForces() {
    for (int i = 0; i < system.bodyCount; i++) {
      attract(system.bodies[i]); //this won't do anything to itself
    }
  }

  void updatePosition() {
    //apply acc
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }

  void show() {
    fill(col);
    ellipse(loc.x, loc.y, size, size);
  }
}
