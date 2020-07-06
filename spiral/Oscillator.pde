class Oscillator {
  PVector angle;
  PVector velocity;
  PVector acceleration;
  
  PVector amplitude;  
  
  Oscillator() {
    angle = new PVector(0, 0);
    amplitude = new PVector(random(width / 2), random(height / 2));
    
    velocity = new PVector(0.0, 0.0);
    acceleration = new PVector(0.0, 0.0);
  }
  
  void update() {
    velocity.add(acceleration);
    angle.add(velocity);    
    
    acceleration.mult(0);
  }
  
  void applyForce(PVector force) {
    acceleration.add(force); 
  }
  
  void display() {
    float x = amplitude.x * sin(angle.x);
    float y = amplitude.y * sin(angle.y);
    
    stroke(0);
    fill(255);
    push();
    translate(width / 2, height / 2);
    //line(0, 0, x, y);
    point(x, y);
    //ellipse(x, y, 16, 16);   
    pop();
  }
  
  
  
  
  
}
