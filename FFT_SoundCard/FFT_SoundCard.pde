import processing.sound.*;
FFT fft;
AudioIn in;
int bands = 128;
float[] spectrum = new float[bands];
SoundFile file;

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
  
}      

void draw() { 
  background(0);
  
  
  fft.analyze(spectrum);
  push();
  translate(width/2, height*7/8);
  beginShape();
  for(int i = 0; i < bands/2; i++){
  // The result of the FFT is normalized
  // draw the line for frequency band i scaling it up by 5 to get more amplitude.
  //line( i, height, i, height - spectrum[i]*height*5 );
  //rect(i*w,height,width/bands,-spectrum[i]*height*5);
    float angle = map(i, 0, bands, 0, TWO_PI);
    //int col = int(map(i, 0, bands, 0, 255));
    float r = map(spectrum[i], 0, 1, 0, width/2)*10;
    constrain(r,0,height*7/8);
  // trying a circular visualisation
    float x = r*cos(angle-PI/2);
    float y = r*sin(angle-PI/2);
    //stroke(col);
    //line(0,0,x,y);
    vertex(x,y);
  }
  endShape();
  
  // mirroring
  beginShape();
  for(int i = 0; i < bands/2; i++){
    float angle = map(i, 0, bands, 0, TWO_PI);
    float r = map(spectrum[i], 0, 1, 0, width/2)*10 ;
    float x = -r*cos(angle-PI/2);
    float y = r*sin(angle-PI/2);
    //stroke(col);
    //line(0,0,x,y);
    vertex(x,y);
  } 
  
  endShape();
  pop();
  
}

void keyPressed(){
  if(keyCode == ' '){
    if(file.isPlaying()){
      file.pause();
    } else {
      file.play();
    }
  } else if(keyCode == 'r'){
    file.jump(0);
  }
}
