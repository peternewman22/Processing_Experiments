class Planet{
  float a, b, c, d, r;
  color colour;
  PVector pos;
  Planet(float a_, float b_, float c_, float d_, color col){
    a = a_;
    b = b_;
    c = c_;
    colour = col;
    update();
  }  
  
  void calculateR(){
    r = pow(b,2)/(a-c*cos(theta));
  }
  
  void update(){
    pos = new PVector(r*cos(theta), r*sin(theta));
  }
  
  void show(){
    fill(colour);
    ellipse(pos.x, pos.y, d, d);
  }
  
}
