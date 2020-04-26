class Attractor {
  float mass;
  PVector loc;

  Attractor(float mass_, PVector loc_) {
    mass = mass_;
    loc = loc_.copy();
  }
  
  void attract(Mover m){
    PVector r = loc.sub(m.loc);
    float rSq = r.magSq();
    float F = G*mass*m.mass/rSq;
    r.setMag(F);
    m.applyForce(r);
  }
  
  void show(){
    fill(0,0,255);
    ellipse(width/2, height/2, 200, 200);
  }
}
