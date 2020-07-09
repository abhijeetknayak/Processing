float angle = 0;
float angle_vel = 0.5;
float startangle = 0.0;
float amplitude = 100;
Pendulum pendulum;

void setup() {
  size(400, 400);
  background(255);
  pendulum = new Pendulum();
}

void draw() {
  startangle += 0.02;
  angle = startangle;
  background(255);
  stroke(0);
  noFill();
  
  beginShape();
  
  for(int x = 0; x <= width; x += 5) {
    float y = map(sin(angle), -1, 1, 0, height);
    vertex(x, y);
    angle += angle_vel;
  }
  endShape();
  
  pendulum.update();
  pendulum.display();
  
  
}
