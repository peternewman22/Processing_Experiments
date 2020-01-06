PImage cloud;
PImage drop;
//Particle p;
Cloud c;
Raindrop rd;
PVector cloudStart;
void settings(){
  size(640, 360, P2D);
}

void setup(){
  cloud = loadImage("cloud-8.png");
  cloud.resize(200,0);
  cloudStart = new PVector(width/2, height = 40); 
  c = new Cloud(cloudStart, 4);
  drop = loadImage("Raindrop-8");
}

void draw(){
  background(0);
  
  if (mousePressed){
    PVector windForce = new PVector(0.001*(width/2 - mouseX), 0);
    c.applyForce(windForce);
  }
  
  
  c.update();
  c.display();

}
