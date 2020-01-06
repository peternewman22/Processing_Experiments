float angle;
float D; 
float r;
ArrayList<Float> curve;
int maxSize;

void settings() {
  size(1280, 720);
}

void setup() {
  angle = -HALF_PI;
  D = width/3;
  noFill();
  r = D/2;
  curve = new ArrayList<Float>();
  maxSize = 1400;
}

void draw() {
  background(0);
  //draw axis
  stroke(255, 100);
  strokeWeight(2);
  line(width/6, 0, width/6, height);
  line(0, height/2, width, height/2);

  //setup circle
  pushMatrix();
  translate(width/6, height/2);
  stroke(255);
  strokeWeight(4);
  ellipse(0, 0, D, D);

  //generate x and y from the angle
  float x = r * cos(angle);
  float y = r * sin(angle);
  
  //add to array of y values;
  curve.add(0,y);

  //draw the line and point
  stroke(255);
  line(0, 0, x, y);

  //draw the connecting line
  stroke(255,100);
  line(x,y,r,y);
  popMatrix();
  
  //move across to where the curve will be generated from
  pushMatrix();
  
  translate(width/3, height/2);
  stroke(255);
  beginShape();
  //for (int i = curve.size() -1 ; i > 0; i--){   
  for (int i = 0; i < curve.size(); i++){
    vertex(i, curve.get(i));
   }
  endShape();
  
  //drawing the drawing line

  popMatrix();
  
  
  //remove unneeded vertices
  if (curve.size() > maxSize){
    curve.remove(maxSize -1);
  }

  //iterate angle;
  angle += 0.01;
}
