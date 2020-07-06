float r = 10;
float theta = 0;

void setup() {
  size(500, 500);
  background(255);  
}

void draw() {
  float x = r * sin(theta);
  float y = r * cos(theta);
  
  noStroke();
  fill(0);
  ellipse(x + width / 2, y + height / 2, 16, 16);
  
  theta += 0.03;
  r += 0.1;
  
  
}
