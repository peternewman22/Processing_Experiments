/*
particle class
particles exert a force on each other, but only sideways as a function of their distance.
repulsive force
*/
Particle particle;
Particle[] particles;
int particle_number;
float spacing;

void setup(){
  size(720, 720);
  particle_number = 9;
  spacing = width/particle_number; 
  particles = new Particle[particle_number]; //make an array of 100 particles
  for(int i = 0; i < particle_number; i++){
    particle = new Particle(new PVector((i+0.5)*spacing, height/2), 100);
    particles[i] = particle;
  }
  
}

void draw(){
  background(0);
  for(int i = 0; i < particles.length; i++){
    particles[i].show();
  }
  
  
}
