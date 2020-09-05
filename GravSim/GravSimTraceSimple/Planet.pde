class Planet {
  color col;
  float mass, radius;
  PVector pos, vel, acc;
  
  Planet(float mass_, float radius_, PVector pos_, PVector vel_, color col_) {
    col = col_;
    mass = mass_;
    radius = radius_;
    pos = pos_.copy();
    vel = vel_.copy();
    acc = new PVector(0, 0);
  }
 

  void applyForce(PVector f) {
    acc.add(f.div(mass));
  }

  void attract(Sun s) {
    float r = pos.dist(s.pos);
    PVector f = PVector.sub(sun.pos, pos);
    f.normalize();
    f.mult(G*mass*s.mass/pow(r,2));
    applyForce(f);
  }
  
  Planet update(){
    attract(sun);
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    return new Planet(mass, radius, pos.copy(), vel.copy(), col);
  }
  
  void show(){
    fill(col);
    noStroke();
    ellipse(pos.x, pos.y, radius, radius);
  }
}
