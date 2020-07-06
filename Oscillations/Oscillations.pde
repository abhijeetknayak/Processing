float angle = 0.0;
float angular_acc = 0.1;
float angular_vel = 0.0;
void setup()
{
  size(400, 400);
  background(255);

}

void draw() {
  background(255);
  angular_vel += angular_acc;
  print(angular_vel, '\n');
  angle += angular_vel;
  if (angle >= 360.0) {
    angle -= 360.0;
  }
  push();
  translate(40, 40);
  rotate(radians(angle));
  fill(175);
  ellipse(-20, -20, 10, 10);  
  ellipse(20, 20, 10, 10);
  fill(0);
  line(-20, -20, 20, 20);
  pop();
  
  
  
}
