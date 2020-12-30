class particle{
  PVector pos;
  PVector vel;
  float visibility;
  
  particle(PVector p, PVector v){
    pos = p.copy();
    vel = v.copy();
  }

  void update(){
    pos.add(vel);
    if(pos.x < -width/2 || pos.x > width/2){
      vel.x = -vel.x;
    }
    
    if(pos.y < -height/2 || pos.y > height/2){
      vel.y = -vel.y;
    }
  }
  
  void render(){
    stroke(255, 100);
    strokeWeight(1);
    point(pos.x, pos.y);
  }
}
