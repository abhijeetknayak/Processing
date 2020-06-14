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
     velocity.limit(100);
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
}
