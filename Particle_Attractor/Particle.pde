
// - - - - - - - - - - - - - - - - - - - - - - - 
// PARTICLE CLASS
// - - - - - - - - - - - - - - - - - - - - - - - 
class Particle { 
  PVector location_p, velocity_p, location_old, orbit, orbit_average;
  Float distance;
  Float gravity;
  boolean display = true;
  ArrayList<Attractor> att = null;
  int destructionThreshold = 2;
  int gravityThreshold = 8;
  float friction = .1;
  int segmentLength = 1;
  int c;
  // Arguments
  Particle(float xPosition_, float yPosition_, float xVelocity_, float yVelocity_, ArrayList<Attractor> _a, int _c) {
    location_p = new PVector(xPosition_, yPosition_);
    location_old = new PVector(xPosition_, yPosition_);
    velocity_p = new PVector(xVelocity_, yVelocity_);
    att = _a;
    c = _c;
  }

  // Display Particles
  void display() {
    if (display) {
      stroke(c);
      // Calculate Attractor Forces on Particle
      orbit = new PVector();
      orbit_average = new PVector();    
      for (int i = 0; i<att.size(); i++) {
        // code to reduce flyaway particles
        if (PVector.dist(location_p, att.get(i).location_n) < destructionThreshold) {
          display = false;
        }

        orbit = PVector.sub(location_p, att.get(i).location_n);
        orbit.normalize();
        distance = PVector.dist(location_p, att.get(i).location_n);
        gravity = 1000/distance;
        gravity = att.get(i).magnetism / sqrt(distance * att.get(i).frequency);
        println("gravity "+gravity);
        if (gravity < gravityThreshold) {
          gravity = 0.0;
        }
        orbit.mult(gravity);
        // Average Multiple Attractor Forces
        if ( i==0 ) {
          orbit_average = orbit.get();
        }
        else {
          orbit_average.add(orbit);
        }
      }
      //      println(gravity);
      orbit_average.div(att.size());
      // Update Particle Velocity with Attractor Force
      velocity_p.sub(orbit_average);
      velocity_p.mult(friction);
      // Update Particle Position - Code to simplify PDF complexity
      if (PVector.dist(location_old, location_p) > segmentLength) {
        line(location_old.x, location_old.y, location_p.x, location_p.y);
        location_old.set(location_p);
      }
      location_p.add(velocity_p);
    }
  }
}

