class Mover{
  //dec var
  PVector loc;
  PVector vel;
  PVector acc;
  float mass;
 
  // initializing
  Mover(){
  loc = new PVector(width/2, height/2);
  vel = new PVector(random(2,4),0);
  acc = new PVector(0,0);
  mass = random(1,4);
  }
  
  void update(){
    vel.add(acc);
    loc.add(vel);
    //reset acceleration
    acc.mult(0);
  }
  
  void applyForce(PVector f){
    PVector force = PVector.div(force,mass);
    acc.add(force);
  }
  
  void display(){
    ellipse(loc.x, loc.y, mass*20, mass*20);
  }
  
}
