Object objects[];
Attractor attractors[];
void setup() {
  size(1200, 800);
  
  objects = new Object[50];
  attractors = new Attractor[10];
  for (int i = 0; i < objects.length; i++) {
    objects[i] = new Object(10, random(width), random(height), 50, 50); 
  }
  for (int i = 0; i < attractors.length; i++) {
    float mass = 20;
    float G = 0.4;
    attractors[i] = new Attractor(random(width), random(height), mass, G); 
  }  
}

void draw() {
  //background(0);
  for (int i = 0; i < attractors.length; i++) {
    attractors[i].display();
  }
  for (int i = 0; i < attractors.length; i++) {
    for (int j = 0; j < objects.length; j++) {
      PVector force = attractors[i].attract(objects[j]);
      objects[j].applyForce(force);
    } 
  }
  
  for (int i = 0; i < objects.length; i++) {
    for (int j = 0; j < objects.length; j++) {
      if (i != j) {
        PVector force = objects[i].attract(objects[j]);
        objects[i].applyForce(force);
      }
    }
  }
  
  for (int i = 0; i < objects.length; i++) {
    PVector mouse = new PVector(mouseX, mouseY);
    objects[i].attractMouse(mouse);
    objects[i].update();
    //objects[i].display();
    point(objects[i].location.x, objects[i].location.y); 
  }
  

  

  
  
  
  
}
