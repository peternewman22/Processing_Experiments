class Body{
  float mass;
  PVector loc, vel, acc;
  PVector[] projectionPoints;
  float size;
  Boolean animate;
  color col;
  
  Body(float mass_, PVector loc_, PVector vel_, float size_, color col_){
    mass = mass_;
    loc = loc_.copy();
    vel = vel_.copy();
    acc = new PVector(0,0);
    size = size_;
    animate = false;
    col = col_;
  }
  
  void attract(Body otherBody){
    // F = -G*m1*m2/r
    float r = loc.dist(otherBody.loc);
    //calculate
    float F = bigG*mass*otherBody.mass/r;
    PVector f = otherBody.loc.sub(loc);
    f.setMag(F);
    applyForce(f);
  }
  
  void applyForce(PVector f_){
    PVector f = f_.copy();
    acc.add(f);
    acc.div(mass);
  }
  
  void updateForces(){
    for(int i = 0; i < system.bodyCount; i++){
         attract(system.bodies[i]); //this won't do anything to the initial thing
      }
  }
  
  void updatePosition(){
    //apply acc
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }
  
  void show(){
    fill(col);
    ellipse(loc.x, loc.y, size, size);
  }

}
