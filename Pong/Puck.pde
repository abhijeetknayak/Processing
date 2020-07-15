

class Puck {
  float x = width / 2;
  float y = height / 2;
  
  float xspeed;
  float yspeed;
  float r = 12;
  
  Puck() {
    reset();    
  }
  
  void update() {
   x += xspeed;
   y += yspeed;
   edges();
  }
  
  void reset() {
   x = width / 2;
   y = height / 2;
   float angle = random(-PI/4, PI/4);
   xspeed = 5 * cos(angle);
   yspeed = 5 * sin(angle);
   
   if (random(1) < 0.5) {
    xspeed *= -1; 
   }
  }
  
  void edges() {
   if ((y < 0) || (y > height)) {
    yspeed = -yspeed; 
   }
   if (x > width) {
     //ding.play();
     leftscore++;
     reset();
   }
   if (x < 0) {
    //ding.play();
    rightscore++; 
    reset();
   } 
  }
  
  void show() {
    fill(255);
    ellipse(x, y, 2 * r, 2 * r);    
  }  
  
  void reverseSpeed(boolean left, float diff, float h) {
    /*xspeed is reversed in every case */
    if (left) {
     float angle = map(diff, 0, h, -PI/4, PI/4); 
     xspeed = 5 * cos(angle);
     yspeed = 5 * sin(angle);      
    }
    else {
     float angle = map(diff, 0, h, -3 * PI/4, 3 * PI/4); 
     xspeed = 5 * cos(angle);
     yspeed = 5 * sin(angle);      
      
    }
    //xspeed = -xspeed;
    /* yspeed remains the same for all cases*/
  }
  
  void checkPaddle(Paddle p, boolean left) {
    if (y < p.y + p.h / 2 && y > p.y - p.h / 2) {
      if (left && x - r < p.x + p.w / 2) {
        /* Puck hits left paddle */
        reverseSpeed(left, y - (p.y - p.h / 2), p.h);        
      }
      else if (!left && x + r > p.x - p.w / 2) {
       /* Puck hits right paddle*/ 
       reverseSpeed(left, y - (p.y - p.h / 2), p.h);
      }      
    }
  }  
}
