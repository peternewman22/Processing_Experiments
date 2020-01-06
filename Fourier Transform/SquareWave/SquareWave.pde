/* 
Modelling a fourier transform
Set up a circle and, using polar coordinates, make an ellipse travel around its edge

*/
float time;
float radius;
ArrayList<Float> wave;
int track_lim;
int steps;

void settings(){
  size(960,720);
}

void setup(){
  track_lim = 600;
  time = 0.0;
  steps = 12;
  wave = new ArrayList<Float>();
//  n = 1;
}

void draw(){
  background(0);
  translate(width/4, height/2); //set the centre to be 1/4 across, 1/2 way down
  //reset x and y each time to start from zero
  float x = 0;
  float y = 0;
  for (int i = 0; i < steps; i++){
     //calculating the radius of the ellipse
    float prevx = x;
    float prevy = y;
    float n = 2 * i + 1; //odd n's 
    float r = 50 * (4 / (n * PI));
    float D = 2 * r;
    
  //working out the x, y coordinates of the edges of the ellipse
  x += r * cos(n * time);
  y += r * sin(n * time);
    
  //draw the ellipse
  noFill();
  stroke(255,100);
  ellipse(prevx,prevy,D,D);
  
  //draw a dot going around the edge of the circle
  //fill(255);
  //ellipse(x, y, 8, 8);
  
  //draw a line from the centre of the circle to the edge
  stroke(255);
  line(prevx, prevy, x, y);
  
} //end loop

// capture the last y value and store it at the FRONT of the wave ArrayList
  wave.add(0, y);

  //draw wave, starting from (0, y)
  //move across
  translate(200, 0);
  noFill();
  beginShape();
  for (int i = 0; i < wave.size(); i++){
    vertex(i, wave.get(i));
  }
  endShape();
  
  //draw the connecting line
  line(x - 200, y, 0, wave.get(0));
   
  //increment time  
  time += 0.03;
  
  //get rid of wave values we don't need over some threshold
  if (wave.size() > track_lim){
    wave.remove(track_lim - 1);
  }
}
