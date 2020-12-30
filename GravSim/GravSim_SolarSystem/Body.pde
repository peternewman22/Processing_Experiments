class Body{
  float mass;
  float diam;
  color colour;
  PVector pos, vel, acc;
  int ix;
  Body(float m, float d, PVector initPos, PVector initVel, color col, int ID){
    mass = m;
    diam = d;
    pos = initPos.copy();
    vel = initVel.copy();
    acc = new PVector(0,0);
    colour = col;
    ix = ID;
  }
  
  void applyForce(PVector f){
    f.div(mass);
    acc.add(f);
  }
  
  void accumulateGravForce(){
    
  }
  
}
