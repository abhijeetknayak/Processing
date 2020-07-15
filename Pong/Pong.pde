import processing.sound.*;

Puck puck;
SoundFile ding;
Paddle left;
Paddle right;

int leftscore = 0;
int rightscore = 0;


void setup() {
  size(600, 400);
  puck = new Puck();
  
  //ding = new SoundFile(this, "sample.mp3");
  left = new Paddle(true);
  right = new Paddle(false);
  
  
  
  
}

void draw() {
  background(0);
  
  puck.checkPaddle(left, true);
  puck.checkPaddle(right, false);
  
  left.show();
  right.show();  
  puck.show();
  puck.update();  
  
  textSize(32);
  text(leftscore, 32, 40);
  text(rightscore, width - 64, 40);
}

void keyReleased() {
 left.move(0);
 right.move(0);
  
}

void keyPressed() {
 if (key == 'a' || key == 'A') {
  left.move(-10); 
 }
 if (key == 'z' || key == 'Z') {
  left.move(10); 
 }
 if (key == 'j' || key == 'J') {
  right.move(-10); 
 }
 if (key == 'n' || key == 'N') {
  right.move(10); 
 }
  
  
}
