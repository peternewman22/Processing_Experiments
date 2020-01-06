class Attractor{
  //var dec
  PVector loc;
  float grav_const;
  float mass;
  float size;
  
  //initializing
  Attractor(){
  loc = new PVector(width/2, height/2);
  grav_const = 1;
  mass = 1;
  size = 1;
  }
  
  void display(){
    ellipse(loc.x, loc.y, size*48, size*48);
  }
  
  // the attract function: takes a Mover, m, and calculates the attractive force applied to it
  // Uses the formula F = (G * m_1 * m_2) / (d * d)
  PVector attract(Mover m){
    
    // calculate the vector to the mover
    PVector r = PVector.sub(loc, m.loc);
    
    // make a distance variable on the fly
    float d_sqr = r.magSq();
    
    // normalize the vector
    r.normalize();
    
    // scale by the force vector;
    PVector force = r.mult((grav_const * mass * m.mass)/d_sqr);
    
    //return PVector
    return force;
  }
}
