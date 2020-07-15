var r = 50;
var c = 50;
var w = 0; 
var h = 0;
var grid = new Array(c);
var next = new Array(c);

function Cell(i, j, alive) {
  this.i = i;
  this.j = j;
  this.alive = alive;
  
  this.display = function() {
    var c = 0;
    if (this.alive) {
      c = 255;
    }
    fill(c);
    noStroke();
    rect(this.i * w, this.j * h, w - 1, h - 1);
  };
  
  this.nextGen = function() {
    var count = 0;
    
    for (let i = -1; i <= 1; i++) {
      for (let j = -1; j <= 1; j++) {
        
        count += grid[(this.i + i + c) % c][(this.j + j + r) % r].alive;
      }
    }
    
    count -= grid[this.i][this.j].alive;
    
    if ((this.alive == 1) && ((count < 2) || (count > 3))) {
      next[this.i][this.j] = 0; 
    }
    else if((this.alive == 0) && (count == 3)) {
      next[this.i][this.j] = 1; 
    }
    else {
      next[this.i][this.j] = grid[this.i][this.j].alive; 
    }
    
  };
 
 
  
  
  
  
  
  
  
}

function setup() {
  createCanvas(400, 400);
  w = width / r;
  h = width / c;
  for (var i = 0; i < c; i++) {
    grid[i] = new Array(r);
  }
  
  for (i = 0; i < c; i++) {
    for (var j = 0; j < r; j++) {
      var alive = floor(random(2));
      grid[i][j] = new Cell(i, j, alive);
    }
  }
  
  for (i = 0; i < c; i++) {
    next[i] = new Array(r);
  }
  for (let i = 0; i < c; i++) {
    for (let j = 0; j < r; j++) {
      next[i][j] = 0;
    }
  }
  
}


function draw() {
  background(0);
  var i = 0, j = 0;
  
  for (i = 0; i < c; i++) {
    for (j = 0; j < r; j++) {
      if (0) {
        next[i][j] = grid[i][j].alive; 
      }
      else {
        grid[i][j].nextGen();
      }      
    }
  }
  for (i = 0; i < c; i++) {
    for (j = 0; j < r; j++) {
      grid[i][j].alive = next[i][j];
    }
  }
  for (i = 0; i < c; i++) {
    for (j = 0; j < r; j++) {
      grid[i][j].display();
    }
  }

}
