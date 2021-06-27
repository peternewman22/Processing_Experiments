import processing.sound.*;

// setting up sound
SoundFile file;
FFT fft;
AudioIn in;
int bands = 64; // must be a multiple of two
float[] spectrum = new float[bands];
ArrayList<Float> low;

// for testing purposes
float greatestAmp = 0;

// setting up main vis
Mover[] movers;
int armCount = 6; // number of moving arms
int moverCount = 32; // number of circles
float moverDiam = 12;
float gravMag = 3;
PVector grav = new PVector(0, gravMag);
float a = 0; // slow global rotation


void setup() {
  size(720, 720);

  //println(allSounds.list());
  file = new SoundFile(this, "epic.mp3");

  // Create an Input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  //in = new AudioIn(this, 0);

  // start the Audio Input
  //in.start();
  file.play();

  // patch the AudioIn
  fft.input(file);
  stroke(255);
  //colorMode(HSB, 255);
  strokeWeight(2);
  stroke(255);
  noFill();

  textAlign(LEFT);
  textSize(20);
  low = new ArrayList<Float>();

  movers = new Mover[32];
  for (int i = 0; i < 32; i++) {
    movers[i] = new Mover(i*moverDiam, i*(width/2)/moverCount);
  }

  colorMode(HSB, 360, 255, 255);
}

void draw() {
  background(0, 0, 0);

  fft.analyze(spectrum);

  push();
  translate(width/2, height/2);
  //rotate(a);
  
  for(int i = 0; i < movers.length; i ++){
    movers[i].applyForce(grav);
    float f = map(spectrum[i],0,1,1,5);
    movers[i].applyForce(new PVector(0,-f));
    movers[i].update();
    movers[i].show();
  }
  //for (int i = 0; i < armCount; i++) {
  //  rotate(TWO_PI/armCount);
  //  for (Mover m : movers) {
  //    m.show();
  //  }
  //}
  pop();
  a+= 0.001;
}


void showCircleSpike() {
  push();
  translate(width/2, height*7/8+10);
  beginShape();
  for (int i = 0; i < bands/2; i++) {
    // The result of the FFT is normalized
    // draw the line for frequency band i scaling it up by 5 to get more amplitude.
    //line( i, height, i, height - spectrum[i]*height*5 );
    //rect(i*w,height,width/bands,-spectrum[i]*height*5);
    float angle = map(i, 0, bands, 0, TWO_PI);
    //int col = int(map(i, 0, bands, 0, 255));
    float r = map(spectrum[i], 0, 1, 100, width/2);

    // trying a circular visualisation
    float x = r*cos(angle-PI/2);
    float y = r*sin(angle-PI/2);
    //stroke(col);
    //line(0,0,x,y);
    vertex(x, y);
  }
  endShape();

  // mirroring
  beginShape();
  for (int i = 0; i < bands/2; i++) {
    float angle = map(i, 0, bands, 0, TWO_PI);
    float r = map(spectrum[i], 0, 1, 100, width/2);
    float x = -r*cos(angle-PI/2);
    float y = r*sin(angle-PI/2);
    //stroke(col);
    //line(0,0,x,y);
    vertex(x, y);
  }

  endShape();
  pop();
}

void showLevels(int freqBand) {
  float amp = spectrum[freqBand];
  if (amp > greatestAmp) {
    greatestAmp = amp;
  }
  low.add(amp);

  stroke(255, 100);
  for (int i = 0; i < 10; i++) {
    line(0, 500 - i*50, width, 500 - i*50);
  }

  stroke(255, 0, 0);
  line(0, 500 - greatestAmp*100, width, 500 - greatestAmp*100);


  stroke(255);
  beginShape();
  for (int i = low.size()-1; i > 0; i--) {
    vertex(i*5, 500-low.get(i)*100);
  }
  endShape();

  if (low.size() > width/5) {
    low.remove(0);
  }
}

void keyPressed() {
  if (keyCode == ' ') {
    if (file.isPlaying()) {
      file.pause();
    } else {
      file.play();
    }
  }
}
