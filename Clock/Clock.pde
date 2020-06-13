float minX = 0;
float minY = 0;
float hourX = 0;
float hourY = 0;
float secondX = 0;
float secondY = 0;
float minTheta = -PI / 1800.0;
float secTheta = -PI / 30.0;
float hourTheta = -PI / 21600.0;

float sr = -230;
float mr = -175;
float hr = -100;
float stheta = 0;
float mtheta = 0;
float htheta = 0;


void setup(){
  size(600, 600);
  background(255);  
}

void ellipses() {
  float x = 0.0, y = 0.0, x1 = 0.0, y1 = 0.0;
  for(float f = 0.0; f < 360.0; f = f + 30.0) {
    x = -250.0 * sin(-f * PI / 180);
    y = -250.0 * cos(-f * PI / 180);
    x1 = -275.0 * sin(-f * PI / 180);
    y1 = -275.0 * cos(-f * PI / 180);
    fill(0);
    ellipse(x, y, 10, 10);
    textSize(15);
    if (f == 0.0) { text(12, x1, y1); }
    else { text(int(f / 30.0), x1, y1); }
  }
}

void draw(){
  translate(300, 300);
  background(255);
  stroke(0);
  strokeWeight(2);
  
  fill(255);
  ellipse(0, 0, 500, 500);
  
  fill(0);
  ellipse(0, 0, 20, 20);
  
  ellipses();

  stheta += secTheta;
  if (stheta == 360) {
    print("STheta reset\n");
    stheta = 0;
  }
  secondX = sr * sin(stheta);
  secondY = sr * cos(stheta);
  
  mtheta += minTheta;
  if ((mtheta + 360.0) < 0.0000001) {
    mtheta = 0;
    print("MTheta reset\n");
  }
  minX = mr * sin(mtheta);
  minY = mr * cos(mtheta);
  
  htheta += hourTheta;
  if ((htheta + 360.0) < 0.0000001) {
    htheta = 0;
    print("HTheta reset\n");
  }
  hourX = hr * sin(htheta);
  hourY = hr * cos(htheta);  
  
  line(0, 0, secondX, secondY);
  line(0, 0, minX, minY);
  line(0, 0, hourX, hourY);
  
  
}
