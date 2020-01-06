/* 
Ripple sim
Click mouse button, a concentric circle comes out, spreading out until it disappears off the thing
*/
ArrayList<drip> drips;
drip d;
PShader blur;

void setup(){
  size(1280, 1280);
  blur = loadShader("blur.glsl");
  drips = new ArrayList<drip>();
  ellipseMode(RADIUS);
  noFill();
  drips.add(new drip(new PVector(width/2, height/2)));
}

void draw(){
  background(0);
  filter(blur);
  stroke(255);
  strokeWeight(5);
  //d.update();
  //d.display();
  for(drip d : drips){
    d.update();
    d.display();
  }
  filter(BLUR, 1);
  
}

void mousePressed(){
  drips.add(new drip(new PVector(mouseX, mouseY)));
}
