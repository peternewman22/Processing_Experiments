class Particle{
  PVector loc;
  PVector vel;
  PVector acc;
  float mass;

  Particle(PVector start, float mass_){
    loc = start.copy();
    vel = new PVector(0,0);
    acc = new PVector(0, 0);
    mass = mass_;
  }
  
  void update(){
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }
  
  void display(){
    fill(155);
    stroke(255);
    strokeWeight(2);
    ellipse(loc.x, loc.y, mass*20, mass*20);
  }
  
  void applyForce(PVector f){
    PVector force = PVector.div(f,mass);
    acc.add(force);
  }

}
