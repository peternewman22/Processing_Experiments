/* I just need the particle class to draw more than one of themselves */
//Particle particle;
Particle[] particles;
int cols, offset;
void setup() {
  size(1500, 1280, P2D);
  cols = 11;
  offset = 120;
  particles = new Particle[cols];
  // load up the particles
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle(new PVector(9*width/10-offset*(i), height/2));
  }
}

void draw() {
  background(0);
  particles[0].update();
  particles[0].show();
  // avoiding the first terms
  for (int i = 1; i < particles.length; i++) {
    particles[i].applyForce(particles[i].repulseForce(particles[i-1]));
    particles[i].update();
    particles[i].show();
  }
}

void mousePressed() {
  PVector windForce = new PVector(-40, 0);
  //particle.applyForce(windForce);
  //for (Particle p : particles) {
  //  p.applyForce(windForce);
  //}
  //for (int i = 0; i < n; i++){
  //  particles[i].applyForce(windForce);

  //  particles2[i].applyForce(windForce);

  //}

  // Now only applying to the FIRST particle
  particles[0].applyForce(windForce);
}
