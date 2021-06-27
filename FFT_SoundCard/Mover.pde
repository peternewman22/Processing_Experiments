class Mover{
  PVector pos, vel, acc;
  float m;
  color col;
  float diam;
  
  Mover(float x){
    pos = new PVector(x, height/2);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    colorMode(HSB);
    col = color(random(255));
    m = 100;
    diam = 10;
    
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
    colorMode(HSB);
    ellipse(pos.x, pos.y, diam, diam);
  }

}
