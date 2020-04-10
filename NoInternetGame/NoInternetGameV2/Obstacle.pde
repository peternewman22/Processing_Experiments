class Obstacle{
  float xposition;
  boolean isDead;
  boolean dying;
  int fillCol;
  boolean hitCharacter;
  
  Obstacle(){
    xposition = width - xoffset;
    dying = false;
    isDead = false;
    fillCol = 255;
  }
  
  void display(){
    rectMode(CENTER);
    fill(fillCol);
    rect(xposition, height/2+yoffset/2, 10, yoffset);
  }
  
  // if in the correct xposition AND if the character is too low...
  void detectHit(Character c){
    if((c.loc.x == xposition) && (c.loc.y > height/2 - yoffset/2)){
      hitCharacter = true;
    }
  }
  
  void update(Character c){
    xposition -= speed;
    if(xposition == c.loc.x){
      detectHit(c);
    }
    if(xposition < 2*xpos){
      dying = true;
    }
    if(dying){
      fillCol -= 4;
    }
    
    if(xposition < xoffset){
      isDead = true;
    }
  }
}
