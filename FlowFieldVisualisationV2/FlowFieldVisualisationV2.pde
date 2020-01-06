int rows, cols;
int res;
int offset;
PVector[][] flowField;
float ex;

void settings(){
  size(480,480);
}

void setup(){
  noFill();
  stroke(255);
  strokeWeight(1);
  res = 60;
  rows = height/res;
  cols = width/res;
  offset = res/2;
  ex = res/3;
  flowField = new PVector[cols][rows];
  init();
  
  
  
}

void init(){
  for(int i = 0; i < rows; i++){
    for (int j = 0; j < cols; j++){
      flowField[i][j] = new PVector(1,1);
    }
  }
}

void drawArrows(PVector[][] field){
  for (int i = 0; i < rows; i++){
    for (int j = 0; j < rows; j++){
      //rect(i*res, j*res, (i+res)*res, (j+res)*res);
      pushMatrix();
        translate(i*res,j*res);
        rect(0,0,res,res);
        pushMatrix();
          translate(offset, offset);
          ellipse(0,0,res,res);
          
          //collect heading
          float angle = field[i][j].copy().heading();
          //rotate(TWO_PI - angle);
          //rotate(angle);
          rotate(HALF_PI - angle);
          line(0,-ex,0,ex);
          ellipse(0,ex,2,2);
        popMatrix();
      popMatrix();
  
    }
  }
}

void draw(){
  background(0);
  drawArrows(flowField);

}
