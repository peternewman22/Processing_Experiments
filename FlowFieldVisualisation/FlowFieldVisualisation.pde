int rows,cols;
int res;
int offset;
PVector[][] flowfield;
float ex;



void setup(){
  size(480,480);
  res = 60;
  rows = height/res;
  cols = width/res;
  offset = res/2;
  flowfield = new PVector[cols][rows];
  ex = res/3;
  init();
  //fill the flowfield with random vectors once
}

void init(){
  for (int i = 0; i < rows; i++){
    for (int j = 0; j < cols; j++){
      flowfield[i][j] = PVector.random2D();
      //flowfield[i][j] = new PVector(1,0);
    }
  }
}

void arrow(int x1, int y1, int x2, int y2, float ex){
  line(x1, y1, x2, y2);
  pushMatrix();
  translate(x2, y2);
  float a = atan2(x1-x2, y2- y1);
  rotate(a);
  beginShape();
    vertex(0,0);
    vertex(-ex/6, -ex/3);
    vertex(ex/6, -ex/3);
}
//PVector lookup(PVector lookup){
//  return flowfield[cols][rows].get();
//}


void draw(){
background(0);
for (int i = 0; i < rows; i++){
  for (int j = 0; j < cols; j++){
    noFill();
    stroke(255);
    strokeWeight(1);
    //fill(random(255));
    
    //ellipse(i*res+offset,j*res+offset,res,res);
    
    rect(i*res,j*res,(i+res)*res,(j+res)*res);
    
    float angle = flowfield[i][j].copy().heading();
    
    pushMatrix();
    //go to the middle of each box
      translate(i*res+offset, j*res+offset);
      //look up the heading of the thing
      rotate(angle);
      //draw a line to the edge of the box
      //line(-res/4,-res/4,res/4,res/4);
      line(0,-ex,0,ex);

      //translate to the end of the line

      translate(ex, ex);
      float a = atan2(ex,ex);
      rotate(a);
      fill(255);
      beginShape();
        vertex(0,0);
        vertex(-ex/3, -ex/2);
        vertex(ex/3, -ex/2);
      endShape();
      
    popMatrix();
  }
}
}
