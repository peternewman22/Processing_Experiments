import controlP5.*;

ControlP5 CP5;
Slider bigGSlider, initVelSlider, m2Slider;
float bigG, initVel, m2;

System system;

void setup(){
  size(1000, 1000);
  CP5 = new ControlP5(this);
  bigGSlider = CP5.addSlider("big G")
    .setRange(0, 0.1)
    .setValue(0.001)
    .setPosition(width-350, 20)
    .setSize(300,20);
    
  initVelSlider = CP5.addSlider("initVel")
    .setRange(0,100)
    .setValue(1)
    .setPosition(width-350, 50)
    .setSize(300, 20);
    
  m2Slider = CP5.addSlider("m2")
    .setRange(10, 1000)
    .setValue(100)
    .setPosition(width-350, 80)
    .setSize(300, 20);
    
  system = new System();
}

void draw(){
  background(0);
  bigG = bigGSlider.getValue();
  initVel = initVelSlider.getValue();
  m2 = m2Slider.getValue();
  
  //system.updateForces();
  //system.updatePosition();
  system.show();
  
  //if(system.animate){
  //  loop();
  //} else {
  //  noLoop();
  //}
}

void keyReleased(){
  if(keyPressed == true){
    system.toggleAnimation();
  }
}
