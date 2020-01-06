class drip{
  PVector loc;
  float r;
  drip(PVector loc_){
    loc = loc_.copy();
    r = 0;
  }
  
  void update(){
    r += 1;
  }
  
  void display(){
    ellipse(loc.x, loc.y, r, r);
  }
  
}
