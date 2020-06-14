var rows = 20;
var cols = 20;
var grid, w, h;

function make2DArray(cols, rows) {
  var arr = new Array(cols);
  
  for (var i = 0; i < arr.length; i++) {
    arr[i] = new Array(rows);
  }
  return arr; 
}

function gameOver() {
  console.log("GAME OVER!");
  for (var i = 0; i < cols; i++) {
    for (var j = 0; j < rows; j++) {
      grid[i][j].revealed = true;
    }
  }
  
}
function mouseClicked() {
  var i = floor(mouseX / w);
  var j = floor(mouseY / h);
  if (mouseButton === CENTER) {
    console.log("RIGHT");
    grid[i][j].flagged = true;
  }
  else {
    grid[i][j].revealed = true;
    if (grid[i][j].mine) {
      gameOver();
    }
    if (grid[i][j].value == 0 && !grid[i][j].mine) {
      grid[i][j].revealNeighbors(); 
    }
  }
}

function setup() {
  createCanvas(400, 400);
  w = width / cols;
  h = height / rows;
  var i, j;
  grid = make2DArray(cols, rows);
  for (i = 0; i < cols; i++) {
    for (j = 0; j < rows; j++) {
      grid[i][j] = new Cell(i, j);
    }
  }
  for (i = 0; i < cols; i++) {
    for (j = 0; j < rows; j++) {
      grid[i][j].countNeighbors();
    }
  }
}


function draw() {
  background(255);
  for (var i = 0; i < cols; i++) {
    for (var j = 0; j < rows; j++) {
      grid[i][j].display();
    }
  }  

}
