class Particle{
  PVector loc, vel, acc;
  float mass, psize, repulse_factor;
  
  Particle(PVector loc_, float mass_){
    loc = loc_.copy();
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    repulse_factor = 0.1;
    mass = mass_;
    psize = 40;
  }
  
  //work out distance from neighbours
  PVector calcForce(Particle neighbour){
    // calculate distance
    float d = loc.dist(neighbour.loc);
    
    //force in the direction of the neighbour
    PVector force = PVector.sub(neighbour.loc, loc);
    
    //scaled by the repulsive force and by distance
    force.mult(repulse_factor/d);
    return force;
  }
  
  //void applyForce(){
  //  acc.add(calcForce(
  //}
  
  void update(){
  
  }
  
  void show(){
    fill(255);
    ellipse(loc.x, loc.y, psize, psize); 
  }

}
