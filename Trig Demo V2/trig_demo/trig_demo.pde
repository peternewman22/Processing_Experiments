float angle;
float r;
float ax, ay;

void settings(){
  size(1280, 720);
}

void setup(){

  noFill();
  angle = 0;
  r = 100;
  ax = width/5;
  ay = height/2;
}

void draw(){
  background(0);
  stroke(255,100);
  strokeWeight(1);
  line(ax, 0, ax, height); //draw the axis
  line(0, ay, width, ay);
   
  pushMatrix();
    strokeWeight(2);
    translate(ax-r, ay);
    ellipse(0,0,2*r,2*r);
    strokeWeight(3);
    line(0,0,r,0);
    
    
  popMatrix();
 
}
