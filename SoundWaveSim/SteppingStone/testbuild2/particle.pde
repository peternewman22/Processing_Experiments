class Particle {
  PVector loc, vel, acc, anchor;
  float size, mass, k, radius;
  int particle_depth;
  Particle(PVector loc_) {
    anchor = loc_;
    loc = anchor.copy();
    size = 100;
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = 5;
    k = 0.01;
    particle_depth = 10;
    radius = 100;
  }

  void show() {
    fill(255);
    for (int i = 0; i<particle_depth; i++) {
      ellipse(loc.x, (i+1)*height/(particle_depth+1), size, size);
    }
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
  
  PVector repulseForce(Particle p){
    // looks to the right (down the particle array
    // calculate the distance
    
    float d = loc.dist(p.loc);
    // within a particular radius
    if (d < radius){
    PVector repulseForce = PVector.sub(loc, p.loc);
    repulseForce.normalize();
    repulseForce.mult(100/d);
    return repulseForce;
    } else {
      PVector repulseForce = new PVector(0,0);
      return repulseForce;
    }
    
  }
  
}
