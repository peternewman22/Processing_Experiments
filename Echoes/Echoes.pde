/*
Modelling sound waves by sending particles scattering in all directions
Bounce off surfaces
*/

particle[] wavefront;
int particleCount;
float t, v;

void setup(){
    size(500, 500);
    particleCount = 720;
    wavefront = new particle[particleCount];
    initWavefront();
    t = 0;
}

void draw(){
    background(0);
    updateWavefront();
    renderWavefront();
    t += 1;
}

void initWavefront(){
    for(int i = 0; i < particleCount; i++){
        PVector heading = new PVector(cos(i/2), sin(i/2));
        wavefront[i] = new particle(new PVector(0,0), heading);
    }
}

void updateWavefront(){
  for(particle p : wavefront){
    p.update();
  }
}

void renderWavefront(){

    pushMatrix();
    translate(width/2, height/2);
    for(int i = 0; i < particleCount; i++){
        wavefront[i].render();
    }
    popMatrix();
}
