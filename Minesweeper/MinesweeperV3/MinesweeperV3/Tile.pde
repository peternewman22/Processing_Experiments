class Tile{
  int x, y;
  boolean isBomb;
  String label;
  int nearbyBombs;
  
  Tile(int x_, int y_){
    x = x_;
    y = y_;
    isBomb = random(1) < 0.25;
    label = getLabel(x,y);
    //print("("+x+", "+y + ") "+label+"\n");
    nearbyBombs = 0;
  }
  
  void show(){
    fill(255, 250);
    stroke(0);
    rect(offset + x*w, offset + y*w, w, w);
    if(isBomb){
      fill(0);
      noStroke();
      ellipse(offset + w/2+ x*w, offset + w/2+ y*w, w*0.6, w*0.6);
    }
  }
}
