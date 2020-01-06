/* push on a column of points modelled as springs */
/* after the initial, we need a "look right and apply repulse force" thing
   Note: this moves away from physics simulation
   Note: the particles fill from the top of the screen
   Note: this isn't a real physics simulation. We're just copying the one thing.
   */

Particle[] particles, particles2;
int n, offset;

void setup() {
  size(1280, 1280);
  n = 5;
  offset = 60;
  particles = new Particle[n];
  particles2 = new Particle[n];
  for (int i = 0; i < particles.length; i++) {
    Particle particle = new Particle(new PVector(width/2+offset, (i+1)*height/(n+1)));
    particles[i] = particle;
  }
  for (int i = 0; i < particles2.length; i++) {
    Particle particle = new Particle(new PVector(width/2-offset, (i+1)*height/(n+1)));
    particles2[i] = particle;
  }
}

void draw() {
  background(0);
  // start with one ball
  //for (Particle p : particles) {
  //  p.update();
  //  p.show();
  //}
  for (int i = 0; i < n; i++){
    particles[i].update();
    particles[i].show();
    particles2[i].update();
    particles2[i].show();
  }

  //calculate spring force
}

void mousePressed() {
  PVector windForce = new PVector(-40, 0);

  //for (Particle p : particles) {
  //  p.applyForce(windForce);
  //}
  for (int i = 0; i < n; i++){
    particles[i].applyForce(windForce);

    particles2[i].applyForce(windForce);

  }
}
