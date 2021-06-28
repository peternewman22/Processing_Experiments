class Mover{
  PVector pos, vel, acc;

  color col;
  float diam;
  
  Mover(float x, int col_){
    pos = new PVector(x, 0);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    colorMode(HSB);
    col = color(col_,255,255);

    diam = moverDiam;
    
  }
  
  void applyForce(PVector f){
    acc.add(f);
  }
  
  void update(){
    vel.add(acc);
    pos.add(vel);
    edges();
    acc.mult(0);
  }
  
  void edges(){
    if(pos.y > height/2){
      pos.y = height/2;
      vel.y = 0;
    } else if(pos.y < -height/2){
      pos.y = -height/2;
      vel.y = 0;
    }
  }
  
  void show(){
    fill(col);
    noStroke();
    ellipse(pos.x, pos.y, diam, diam);
  }

}
