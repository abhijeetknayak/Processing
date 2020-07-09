class Pendulum {
  float radius = 125;
  float angle = PI / 4;
  float angular_vel;
  float angular_acc;
  
  void update() {
    float gravity = 0.4;
    angular_acc = -1 * gravity * sin(angle) / radius;
    
    angular_vel += angular_acc;
    angular_vel *= 0.99;
    angle += angular_vel;    
  }
  
  void display() {
    PVector origin = new PVector(100, 100);
    radius = 125;
    PVector location = new PVector(radius * sin(angle), radius * cos(angle));
    translate(origin.x, origin.y);
    stroke(0);
    fill(175);
    line(0, 0, location.x, location.y);    
    ellipse(location.x, location.y, 16, 16);
    
  }
  
  
  
  
  
}
