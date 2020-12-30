class Sun{

  float mass;
  float diam;
  color col;
  PVector pos;
  Sun(float mass_, float diam_, color col_, PVector pos_){
    mass = mass_;
    diam = diam_;
    col = col_;
    pos = pos_.copy();
  }
  
  void show(){
    fill(col);
    noStroke();
    ellipse(pos.x, pos.y, diam, diam);
  }
}
