import processing.sound.*;
FFT fft;
AudioIn in;
int bands = 32;
float[] spectrum = new float[bands];
SoundFile file;
float w;

void setup() {
  size(720, 720);
  w = width/bands;
  
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
  
}      

void draw() { 
  background(0);
  
  
  fft.analyze(spectrum);

  for(int i = 0; i < bands; i++){
  // The result of the FFT is normalized
  // draw the line for frequency band i scaling it up by 5 to get more amplitude.
  //line( i, height, i, height - spectrum[i]*height*5 );
  rect(i*w,height,width/bands,-spectrum[i]*height*5);
  } 
  
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
