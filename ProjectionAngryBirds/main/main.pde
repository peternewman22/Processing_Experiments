import controlP5.*;


ControlP5 controlP5;
Slider s, tp, angle, launchStrength;
int trackingPoints;
float sliderX, sliderY;

ProjectedPath path;

void setup(){
  size(1000, 500);
  fill(255);
  sliderX = 825;
  sliderY = 20;
  controlP5 = new ControlP5(this);
  s = controlP5.addSlider("gravity")
    .setRange(0,20)
    .setValue(10)
    .setPosition(sliderX, sliderY)
    .setSize(100, 25);
  tp = controlP5.addSlider("tracking points")
    .setRange(1, 500)
    .setValue(50)
    .setPosition(sliderX,sliderY+30)
    .setNumberOfTickMarks(500)
    .setSize(100, 25);
  angle = controlP5.addSlider("angle")
    .setRange(0,90)
    .setValue(radians(45))
    .setPosition(sliderX, sliderY+60)
    .setSize(100, 25);
  launchStrength = controlP5.addSlider("launchForce")
    .setRange(0,100)
    .setValue(1)
    .setPosition(sliderX, sliderY+90)
    .setSize(100, 25);
    
  
  
  
  
}

void draw(){
  background(0);
  float gravStrength = s.getValue();
  int trackingPoints = round(tp.getValue());
  float a = radians(angle.getValue());
  float lF = launchStrength.getValue();
  PVector launchF = new PVector(lF*cos(a), -lF*sin(a));
  ProjectedPath path = new ProjectedPath(trackingPoints, launchF, gravStrength);
  path.show();
  
  

}
