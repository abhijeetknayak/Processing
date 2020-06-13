class Object {
   PVector location;
   PVector velocity;
   PVector acceleration;
   PVector dim;
   float mass = 10.0;
   
   Object(float m, float x, float y, float l, float b) {
     mass = m;
     location = new PVector(x, y);
     dim = new PVector(l, b);
     velocity = new PVector(0,0);
     acceleration = new PVector(0,0);
   }
   
   void update() {
     //invisible_force();
     velocity.add(acceleration);
     velocity.limit(10);
     location.add(velocity);   
     acceleration.mult(0);
   }
   
   void applyForce(PVector force) {
     PVector f = PVector.div(force, mass);
     acceleration.add(f); 
   }
   
   void display() {
     fill(255);
     stroke(0);
     rect(location.x, location.y, dim.x, dim.y);
   }
   
   PVector attract(Object object) {
    PVector force = PVector.sub(object.location, location);
    float dist = force.mag();
    
    dist = constrain(dist, 5, 25);
    
    float mag = -0.2 * object.mass * mass / (dist * dist);
    
    force.normalize();
    force.mult(mag);
    return force; 
  }
  
  void attractMouse(PVector mouse) {
    PVector force = PVector.sub(mouse, location);
    float dist = force.mag();
    
    dist = constrain(dist, 1, 25);
    
    float mag = 20.0 * 1.0 * mass / (dist * dist);
    
    force.normalize();
    force.mult(mag);
    
    applyForce(force);      
  }
}
