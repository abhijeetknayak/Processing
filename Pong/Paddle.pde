float gap = 2;

class Paddle {
  float x = 0;
  float y = height / 2;
  float w = 10;
  float h = 100;
  float deltaY = 0;
  
  Paddle(boolean left) {
   /* Constructor */
   if (left) {
    x = w / 2  + gap;
   }
   else {
    x = width - w / 2 - gap; 
   }    
  }
  
  void update() {
   y += deltaY;
   y = constrain(y, h / 2, height - h / 2);
  }
  
  void move(float steps) {
    deltaY = steps; 
    update();
  }
  
  
  void show() {
   fill(255);
   rectMode(CENTER);
   rect(x, y, w, h);
    
    
    
  }
  
  
  
  
  
  
  
}
