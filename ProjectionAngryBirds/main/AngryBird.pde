class AngryBird{
  
  PVector loc, vel;
  float baseFatness;
  float fatness;
  
  AngryBird(PVector loc_, PVector vel_){
    loc = loc_.copy();
    vel = vel_.copy();
    
    baseFatness = 5;
    fatness = (random(1) < 0.5) ? baseFatness : baseFatness*1.5;
  }
  
  void show(){
    fill(255);
    ellipse(loc.x, loc.y, fatness, fatness);
  }
  

}
