float angle;

void settings(){
  size(640, 360);
}

void setup(){
  angle = PI/8;
  rectMode(CENTER);
  fill(255);
  stroke(155);
  strokeWeight(1);
}


void draw(){
  background(0);
  
  pushMatrix();
  translate(width/2, height/2-22);
  rotate(angle);

  rect(0,0, 30, 30);
  popMatrix();
  
    pushMatrix();
  translate(width/2, height/2+22);
  rotate(-angle);

  rect(0,0, 30, 30);
  popMatrix();
  
  angle += 0.01;
  

}
