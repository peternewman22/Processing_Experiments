class Mover{
  PVector pos, vel, acc;
  float m;
  color col;
  float diam;
  
  Mover(float x, int col_){
    pos = new PVector(x, 0);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    colorMode(HSB);
    col = color(col_,100, 100);
    m = 1;
    diam = moverDiam;
    
  }
  
  void applyForce(PVector f){
    acc.add(f.div(m));
  }
  
  void update(){
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }
  
  void show(){
    fill(col);
    noStroke();
    ellipse(pos.x, pos.y, diam, diam);
  }

}
