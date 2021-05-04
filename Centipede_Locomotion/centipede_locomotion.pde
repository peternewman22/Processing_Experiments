// A centipede is made up of a number of segments
// Each segment has a walking animation based on a sine wave with an offset
// Head is the same as the tail, but the "antennae" are more in line
// Each segment has an orientation to arrange the legs
// Stretch goals: get undulation happening down the length of the centipede

Centipede c;

void setup(){
  size(1080, 720, P2D);
  c = new Centipede(500,height/2,10,50,new PVector(1,0));
}

void draw(){
  background(0);
  c.update();
  c.show();
}
