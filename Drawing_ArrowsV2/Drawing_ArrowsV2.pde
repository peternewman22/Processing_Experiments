void settings(){
  size(720,720);
}

void setup(){
  noFill();
  stroke(255);
  strokeWeight(1);
}

void draw(){
  background(0);
  pushMatrix();
    translate(width/2, height/2);
    ellipse(0,0,20,20);
    line(0,0,0,50);
    pushMatrix();
      translate(0,50);
      fill(255);
      beginShape();
        vertex(0,0);
        vertex(-5,-10);
        vertex(5,-10);
        vertex(0,0);
      endShape();
    popMatrix();
  popMatrix();
}
