var cols = 3;
var rows = 3;
var grid = new Array(rows);
var w, h;
var k = 25;
var PLAYER1 = 1;
var PLAYER2 = 2;
var player = PLAYER1;
var winner = 0;
var winX1, winX2, winY1, winY2;

function Spot(i, j) {
 this.i = i;
 this.j = j;
 this.occupied = false;
 this.val = 0; // 0 for O, 1 for X
 this.show = function() {
    fill(255);
    stroke(0);
    rect(this.i * w, this.j * h, w - 1, h - 1);
 };
 this.xMin = this.i * h;
 this.xMax = (this.i + 1) * h;
 this.yMin = this.j * w;
 this.yMax = (this.j + 1) * w;
 this.withinLimits = function(x, y) {
   if (this.occupied === true) { return false; }
   if ((x > this.xMin) && (x < this.xMax) && (y > this.yMin) && (y < this.yMax)) {
     /* Within limit of spot */
     return true;     
   }   
 };
 this.drawX = function() {
   var x1 = this.xMax - k;
   var x2 = this.xMin + k;
   var y1 = this.yMin + k;
   var y2 = this.yMax - k;
   
   stroke(0);
   strokeWeight(2);
   line(x1, y1, x2, y2);
   line(x2, y1, x1, y2);   
 };
 this.drawO = function() {
  var x = this.xMin + h / 2;
  var y = this.yMin + w / 2;
  
  fill(255);
  stroke(0);
  strokeWeight(2);
  ellipse(x, y, w - 2 * k, h - 2 * k);  
 };
 
 
}

function setup() {
  createCanvas(600, 600);
  angleMode(DEGREES);
  
  w = width / cols;
  h = height / rows;
  
  for (var i = 0; i < rows; i++) {
   grid[i] = new Array(cols);
  }
  
  for (i = 0; i < rows; i++) {
   for (var j = 0; j < cols; j++) {
    grid[j][i] = new Spot(i, j); 
     
   }
    
  }

}

function mouseClicked() {
  for (var i = 0; i < rows; i++) {
   for (var j = 0; j < cols; j++) {
    var draw = grid[j][i].withinLimits(height - mouseY, mouseX);
    if (draw) {
      grid[j][i].occupied = true;
      grid[j][i].val = player;  
      checkWin();
      if (player == PLAYER1) { player = PLAYER2; }
      else { player = PLAYER1; }
      break;
    }     
   }
 }
}

function checkWin() {
 for (var i = 0; i < rows; i++) { 
   
    if ((grid[0][i].val == grid[1][i].val) && (grid[1][i].val == grid[2][i].val) && (grid[2][i].val != 0)) {
     winner = player; 
     winX1 = grid[0][i].xMin + h / 2;
     winX2 = winX1;
     winY1 = grid[0][i].yMin + k;
     winY2 = grid[2][i].yMax - k;
     break;
    }
 }
 
  for (var j = 0; j < cols; j++) { 
    if ((grid[j][0].val == grid[j][1].val) && (grid[j][1].val == grid[j][2].val) && (grid[j][2].val != 0)) {
     winner = player; 
     winX1 = grid[j][0].xMin + k;
     winX2 = grid[j][2].xMax - k;
     winY1 = grid[j][0].yMin + w / 2;
     winY2 = winY1;
     break;
    }
 }
 
 if ((grid[0][2].val == grid[1][1].val) && (grid[1][1].val == grid[2][0].val) && (grid[2][0].val != 0)) {
   winner = player; 
   winX1 = grid[0][2].xMax - k;
   winX2 = grid[2][0].xMin + k;
   winY1 = grid[0][2].yMin + k;
   winY2 = grid[2][0].yMax - k;
 }
 else if ((grid[0][0].val == grid[1][1].val) && (grid[1][1].val == grid[2][2].val) && (grid[2][2].val != 0)) {
  winner = player;
  winX1 = grid[0][0].xMin + k;
  winX2 = grid[2][2].xMax - k;
  winY1 = grid[0][0].yMin + k;
  winY2 = grid[2][2].yMax - k;
 }
}

function draw() {
  var i, j;
  background(255);
  rotate(-90);
  translate(-600, 0);
  
  for (i = 0; i < rows; i++) {
   for (j = 0; j < cols; j++) {
    grid[j][i].show(); 
   }    
  }
  
  for (i = 0; i < rows; i++) {
    for (j = 0; j < cols; j++) {
      if (grid[j][i].occupied) {
        if (grid[j][i].val === PLAYER1) {
         grid[j][i].drawX(); 
        }
        else {
         grid[j][i].drawO(); 
        }
      }        
    }
  }
  
  if (winner) {
   console.log("PLAYER %d WINS THE GAME", winner);
   stroke(color(255, 0, 0));
   line(winX1, winY1, winX2, winY2);
   noLoop();
    
    
  }
}
