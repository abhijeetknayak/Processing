Car car;
void setup() {
  size(1000, 1000);
  car = new Car(width / 2, height / 2);
  
  
}

void keyPressed() {
  PVector force;
  float ang_acc = 0.0;
  if (key == 'b' || key == 'B') {
    //car.friction(); 
  }
  if (key == CODED) {
    if (keyCode == UP) {
      force = new PVector(1, 0);
      //ang_acc = -0.01;      
    }
    else if (keyCode == DOWN) {
      force = new PVector(-1, 0);
      //ang_acc = 0.01;      
    }
    else if (keyCode == LEFT) {
      force = new PVector(0, 0);
      ang_acc = -0.1;
    }
    else if (keyCode == RIGHT) {
      force = new PVector(0, 0);
      ang_acc = 0.1;
    }
    else {
      force = new PVector(0, 0); 
    }
  }
  else {
    force = new PVector(0, 0); 
  }
  
  car.applyForce(force);  
  car.applyAngle(ang_acc);
}

void draw() {
  background(255);
  car.display();
  car.update();  
  print(car.location.x, car.location.y, "\n");
}
