import controlP5.*;

ArrayList<Float> acrossWave, downWave;
float r, t, stretchCoeff, tTick;
int xoffset, yoffset;
ControlP5 rSlider, stretchSlider, tSlider;


void setup() {
  size(1000, 1000);
  rSlider = new ControlP5(this);
  rSlider
    .addSlider("rSlider")
    .setPosition(width/2+50, height/2 + 50)
    .setRange(10, width/4)
    .setSize(width/2 - 100, 20)
    .setValue(100);
  r = rSlider.getValue("rSlider");
        
  tSlider = new ControlP5(this);
  tSlider
    .addSlider("tSlider")
    .setPosition(width/2 + 50, height/2 + 150)
    .setRange(0.001, 1)
    .setSize(width/2 - 100, 20)
    .setValue(0.05);
  tTick = tSlider.getValue("tSlider");
  
  stretchSlider = new ControlP5(this);
  stretchSlider
    .addSlider("stretchSlider")
    .setPosition(width/2 + 50, height/2 + 250)
    .setRange(0.001, 5)
    .setSize(width/2 - 100, 20)
    .setValue(1);
  stretchCoeff = stretchSlider.getValue("stretchSlider");
  
  t = 0;
  ellipseMode(RADIUS);
  noFill();
  xoffset = width/4;
  yoffset = height/4;
  acrossWave = new ArrayList<Float>();
  downWave = new ArrayList<Float>();
  
}


void draw() {
  background(220, 220, 220);
  
  //setValues
  r = rSlider.getValue("rSlider");
  stretchCoeff = stretchSlider.getValue("stretchSlider");
  tTick = tSlider.getValue("tSlider");
  
  //draw the circle
  stroke(80, 80, 80);
  strokeWeight(2);
  ellipse(xoffset, yoffset, r, r);
  float x = xoffset + r*cos(t);
  float y = yoffset + r*sin(t);
  strokeWeight(2);  
  
  //drawing the lines
  stroke(169, 169, 169, 100);
  line(x, 0, x, height/2);
  line(0, y, width/2, y);
  
  //drawing the box
  line(0, height/2, width/2, height/2);
  line(width/2, 0, width/2, height/2);
  
  //drawing the points
  strokeWeight(10);
  stroke(255, 0, 0);
  point(x, y);
  point(x, height/2);
  point(width/2, y);
  
  //storing coordinates
  acrossWave.add(0, y);
  downWave.add(0, x);
  
  //drawing the acrosswave
  stroke(80, 80, 80);
  strokeWeight(5);
  beginShape();
  for(int i = 0; i < acrossWave.size(); i++){
    vertex(width/2 + i*stretchCoeff, acrossWave.get(i));
  }
  endShape();
  
  //drawing the downwave
  beginShape();
  for(int i = 0; i < downWave.size(); i++){
    vertex(downWave.get(i), height/2 + i*stretchCoeff);
  }
  endShape();
  
  if(acrossWave.size() > width/2/0.001){
    acrossWave.remove(width/2 - 1);
  }
  
  if(downWave.size() > height/2/0.001){
    downWave.remove(height/2 - 1);
  }
  
  t += tTick;
}
