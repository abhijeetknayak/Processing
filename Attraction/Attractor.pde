class Attractor {
  PVector location;
  float mass;
  float G;
  float val;
  
  Attractor(float x, float y, float m, float g) {
    location = new PVector(x, y);
    mass = m;
    G = g;    
    if (random(1) < 1.0) {
      val = 1; 
    }
    else {
      val = -1; 
    }
  }
  
  PVector attract(Object object) {
    PVector force = PVector.sub(location, object.location);
    float dist = force.mag();
    
    dist = constrain(dist, 5, 25);
    
    float mag = G * object.mass * mass / (dist * dist);
    
    force.normalize();
    force.mult(val * mag);
    return force; 
  }
  
  void display() {
    if (val == 1) {
      fill(color(0, 0, 255)); 
    }
    else {
      fill(color(255, 0, 0)); 
    }
    ellipse(location.x, location.y, mass * 2, mass * 2);  
  }
  
  
  
  
  
  
}
