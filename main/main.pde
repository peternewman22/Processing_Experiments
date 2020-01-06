float time;
ArrayList<Float> wave;
//float[] wave;
int track_lim;
float n, x, y;


void settings() {
  size(720, 720);
}

void setup() {
  track_lim = 600;
  time = 0.0;
  wave = new ArrayList<Float>();
  //n = 1;
  //wave = new float[1000]; //dec array with 1000 numbers
}

void draw() {
  background(0);
  float x = 0;
  float y = 0;
  translate(width/4, height/2); //set pos to a convenient thing

  for (int i = 0; i < 3; i++){
    float prevx = x;
    float prevy = y;
    float n = 2 * i + 1;
  //setting up the calculation: x = r * (Const * Pi) * cos(Const * angle);
    float r = 50 * (4 / (n * PI));
    float D = 2 * r;
    x = r * cos(n * time);
    y = r * sin(n * time);

    wave.add(0, y); //add the beginning of the ArrayList
  //wave.unshift(y);
  // draw main circle
  stroke(255);
  strokeWeight(2);
  noFill();
  ellipse(prevx, prevy, D, D);

  //draw dot
  noFill();
  ellipse(x, y, 8, 8);

  //draw line
  line(prevx, prevy, x, y);
  }
  //draw waveform
  translate(200, 0);
  noFill();
  beginShape();
  for (int i = 0; i < wave.size(); i++) {
    vertex(i, wave.get(i));
  }
  endShape();

  //drawing arrow from the dot over to the waveform
  //line(x-200, y, 0, wave.get(0));

  time += 0.03;

  if (wave.size() > track_lim) {
    wave.remove(track_lim - 1);
  }
}
