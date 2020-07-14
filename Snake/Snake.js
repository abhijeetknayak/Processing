var row = 40;
var col = 40;
let value = 0;
var posX = [300, 300, 300];
var posY = [300, 315, 330];
var dir = 0; // Default left
var interval = 200;
var foodX = [], foodY = [];
var foodActive = false;
var randX = 0, randY = 0;
var score = 0;
var gameOver = false;
for (var i = 0; i < 600; i += 15) {
  foodX.push(i);
  foodY.push(i);
}

var pX = 0, pY = 0;



function setup() {
  createCanvas(600, 600);
  angleMode(DEGREES);
  setInterval(newPos, interval);
  setInterval(generate_food, 200);
  setInterval(generate_poison, 5000);
  
  pX = random(foodX);
  pY = random(foodY);
  
}

function generate_food() {  
  if (!foodActive) {
    foodActive = true;
    randX = random(foodX);
    randY = random(foodY);
  }  
}

function generate_poison() {
   pX = random(foodX);
   pY = random(foodY); 
   while ((pX == randX) && (pY == randY)) {
     pX = random(foodX);
     pY = random(foodY);
   }
}

function eat_poison() {
  if ((pX == posX[0]) && (pY == posY[0])) {
    score -= 1;
    pX = -30;
    pY = -30;
    posX.splice(-1, 1);
    posY.splice(-1, 1);
    if (posX.length == 0) {
      gameOver = true;
    }
  }
}

function check_death() {
  var x = posX[0], y = posY[0];
  for (var i = 1; i < posX.length; i++) {
   if  ((x == posX[i]) && (y == posY[i])) {
    gameOver = true; 
   }   
  }
  
  if (x < 0) {
    gameOver = true;
    //posX[0] = x + 600;
  }
  else if (x > 600) {
   gameOver = true;
   //posX[0] = x - 600;
  }
  if (y < 0) {
    gameOver = true;
   //posY[0] = y + 600;
  }  
  else if (y > 600) {
    gameOver = true;
    //posY[0] = y - 600;
  }
}

function eat_food() {
  if ((randX == posX[0]) && (randY == posY[0])) {
    var l = posX.length;
    foodActive = false;
    score += 1;
    randX = -30;
    randY = -30;
    
    if (posX[l - 1] == posX[l - 2]) {
     /* Same X for new position */
     posX.push(posX[l - 1]);
     if (posY[l - 1] > posY[l - 2]) {
      /* Spawn on right side */
      posY.push(posY[l - 1] + 15);
     }
    }
    else if (posY[l - 1] == posY[l - 2]) {
      /* Same Y for new position */
     posY.push(posY[l - 1]);
     if (posX[l - 1] > posX[l - 2]) {
      /* Spawn on right side */
      posX.push(posX[l - 1] + 15);
     }
  }
  console.log(score);
  }
}

function keyPressed() {
  if (keyCode  === UP_ARROW) {
    value = 255;
    dir = 2; 
  }
  if (keyCode  === DOWN_ARROW) {
    value = 255;
    dir = 3;
  }
  if (keyCode  === LEFT_ARROW) {
    value = 255;
    dir = 0; 
  }
  if (keyCode  === RIGHT_ARROW) {
    value = 255;
    dir = 1;
  }
}

function newPos() {  
  var tempX = posX[0], tempY = posY[0];
  for (i = posX.length - 1; i >= 1; i--) {
    posX[i] = posX[i - 1];
    posY[i] = posY[i - 1];
  }  
  if (dir == 0) {
    posY[0] -= 15; 
  }
  else if (dir == 1) {
    posY[0] += 15; 
  }
  else if (dir == 2) {
    posX[0] += 15;
  }
  else {
    posX[0] -= 15; 
  }
}

function draw() {
  var i = 0, j = 0;
  background(0);
  rotate(-90);
  translate(-600, 0); 
  
  check_death();
  
  for (i = 0; i < posX.length; i++) {
    if (gameOver) {
     fill(color(255, 255, 0)); 
    }
    else {
      if (i == 0) {
       fill(color(255, 0, 0)); 
      }
      else {
       fill(255); 
      }      
    }  
    rect(posX[i], posY[i], 15, 15); 
  }
  
  eat_food();
  eat_poison();
  if (gameOver) {
   noLoop();
   console.log("GAME OVER");
  }
  
  fill(color(0, 255, 0));
  rect(randX, randY, 15, 15);
  
  fill(color(0, 0, 255));
  rect(pX, pY, 15, 15);
}
