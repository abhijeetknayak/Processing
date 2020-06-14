Object object;
void setup() {
  size(1800, 800);
  float mass = 10;
  float x = 0;
  float y = 700;
  float l = 100;
  float b = 100;
  object = new Object(mass, x, y, l, b);
  
  
  
  
}

void draw() {
  background(0);
  PVector forward;
  if (object.velocity.x > 10) {
    forward = new PVector(3.0, -1.0);
  }
  else {
    forward = new PVector(4.0, 0.0); 
  }
  object.applyForce(forward);

  
  float cd = 0.1;
  float rho = 0.1;
  
  PVector drag = object.velocity.copy();
  
  drag.normalize();
  float velMag = object.velocity.mag();
  drag.mult(-0.5 * cd * rho * velMag * velMag);
  
  object.applyForce(drag);
  
  
  object.update();
  object.display();
  
  
  
  
}
