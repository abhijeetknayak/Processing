float r = 10;
float theta = 0;
float angle = 0;
Oscillator oscillator;

float amplitude = 100;
float period = 120;

void setup() {
  size(500, 500);
  background(255);  
  
  oscillator = new Oscillator();
}

void draw() {
  //background(255);
  float x = r * sin(theta);
  float y = r * cos(theta);
  
  float z = amplitude * cos(TWO_PI * frameCount / period);
  z = amplitude * cos(angle);
  angle += 0.05;
  z = map(z, -100, 100, 0, height);  
  
  noStroke();
  fill(0);
  //ellipse(x + width / 2, y + height / 2, 16, 16);
  //ellipse(height / 2, z, 16, 16);
  
  oscillator.update();
  oscillator.display();
  
  theta += 0.03;
  r += 0.1;
  
  
}
