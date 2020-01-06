
void settings() {
  size(480, 480);
}

void setup() {
  noFill();
  stroke(255);
  strokeWeight(2);
}

void drawArrow(int x1, int y1, int x2, int y2) {
  line(x1,y1,x2,y2);
  float a = atan2(y2-y1, x2-x1);
  float d = dist(x1,y1,x2,y2);
  pushMatrix();
    rotate(a);
    // go to the end of the arrow
    translate(x2,y2);
    
    beginShape();
      vertex(0,0);
      vertex(-0.9*d,-0.8*d);
      vertex(0.9*d,-0.8*d);
    endShape();
  popMatrix();
  
}

void draw() {
  background(0);
  translate(width/2, height/2);
  drawArrow(0,0,100,100);
  
  
}
