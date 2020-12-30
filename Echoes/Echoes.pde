/*
Modelling sound waves by sending particles scattering in all directions
Bounce off surfaces
*/

PVector[] wavefront;
int particleCount;
float t;
float v;

void setup(){
    size(1000, 1000);
    wavefront = new PVector[wavefront];
    updateWavefront();
    float t = 0;
    float v = 1;
}

void draw(){
    background(0);
    updateWavefront();
    renderWavefront();
    t += 1;
}

void updateWavefront(){
    for(int i = 0; i < particleCount; i++){
        wavefront[i] = new PVector(v*t*cos(i), v*t*sin(i));
    }
}

void renderWavefront(){
    strokeWeight(5);
    stroke(255);
    for(int i = 0; i < particleCount; i++){
        PVector p = wavefront[i];
        point(p.x, p.y);
    }
}