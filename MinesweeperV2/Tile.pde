class Tile{
  boolean isBomb;
  PVector pos;
  String label;
  color fillCol;
  int surroundingBombs; //gets initialised later
  
  
  Tile(PVector pos_){
    pos = pos_.copy();
    isBomb = random(1) < 0.25;
    fillCol = color(255, 220);
    label = getLabel(pos);
  }
  
  void display(){
     fill(fillCol);
     rect(offset +w*pos.x, offset + w*pos.y, w, w);
     if(isBomb){
       fill(0);
       ellipse(offset + w*pos.x + w/2, offset + w*pos.y + w/2, w/2, w/2);
       //strokeWeight(5);
       //line(offset + w*pos.x + w/2, offset + w*pos.y + w/2, offset + w*pos.x + w/2, offset + w*pos.x - w/2);
     } else if(surroundingBombs > 0){
       fill(255);
       stroke(255);
       text("MINESWEEPER", 100, 100);
     }
     
  }

}
