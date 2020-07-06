class Car {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float angle = radians(0);
  float angular_vel = 0;
  float angular_acc = 0.0;
  
  Car(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
 
  void display() {
    //angle = velocity.heading();
    print("Angle is ", angle);
    push();
    rectMode(CENTER);
    translate(location.x, location.y);
    rotate(angle);
    fill(0);
    rect(0, 0, 40, 20);   
    pop();
  }
  
  void update() {
    //friction();
    velocity.add(acceleration);
    
    angular_vel += angular_acc;
    angle += angular_vel;    
    
    if (abs(velocity.x) < 0.01) {
      velocity.x = 0.0; 
    }
    if (abs(velocity.y) < 0.01) {
      velocity.y = 0.0; 
    }
    
    velocity.limit(10);
    location.add(velocity);
    
    acceleration.mult(0);
    angular_acc = 0.0;
    angular_vel = 0.0;
  }
  
  void applyForce(PVector force) {
    //angle = 0.0;
    //float x_comp = force.x * cos(angle) - force.y * sin(angle);
    //float y_comp = force.x * sin(angle) + force.y * cos(angle);
    //PVector modForce = new PVector(x_comp, y_comp);
    float x = force.x * cos(angle) - force.y * sin(angle);
    float y = force.x * sin(angle) + force.y * cos(angle);
    PVector new_force = new PVector(x, y);
    
    
    acceleration.add(new_force); 
  }
  
  void applyAngle(float acc) {
    angular_acc = acc; 
  }
  
  void friction() {
    float mu = 0.1;
    float N = 1.0;
    PVector f = velocity.copy();
    
    f.normalize();
    f.mult(-1 * mu * N);
    
    applyForce(f);
  }
  
  
  
  
  
  
}
