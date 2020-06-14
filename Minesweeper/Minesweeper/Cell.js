function Cell(i, j) {
  this.i = i;
  this.j = j;
  this.value = 0;
  this.revealed = false;
  this.flagged = false;
  
  if (random(1) < 0.3) {
    this.mine = true;
  } else {
    this.mine = false; 
  }  
  
  this.display = function() {
    noFill();
    stroke(0);
    rect(this.i * w, this.j * h, w - 1, h - 1);
    if (this.flagged) {
      fill(color(255, 0, 0));
      rect(this.i * w, this.j * h, w - 1, h - 1);       
    }
    if (this.revealed) {
      if (this.mine) {  
        fill(127);
        ellipse(this.i * w + w / 2, this.j * h + h / 2, w * 0.5, h * 0.5); 
      }
      else {
        fill(200);
        rect(this.i * w, this.j * h, w - 1, h - 1);
        if (this.value > 0) {
          
          textAlign(CENTER);
          fill(0);
          text(this.value, this.i * w + w / 2, this.j * h + h - 6);
        }
        
      }
    }
  };
  
  this.countNeighbors = function() {
    var count = 0;
    if (this.mine) {
      return -1; 
    } else {
      for (var i = -1; i < 2; i++) {
        for (var j = -1; j < 2; j++) {
          if (this.i + i >= 0 && this.i + i < w && this.j + j >= 0 && this.j + j < h) {
            count += grid[this.i + i][this.j + j].mine ? 1 : 0;
          }
        }
      }
      count -= grid[this.i][this.j].mine ? 1 : 0;
      this.value = count; 
    }   
  };
  
  this.revealNeighbors = function() {
    for (var i = -1; i < 2; i++) {
      for (var j = -1; j < 2; j++) {
        if (this.i + i >= 0 && this.i + i < w && this.j + j >= 0 && this.j + j < h) {
          if (!grid[this.i + i][this.j + j].mine && !grid[this.i + i][this.j + j].revealed) {
            grid[this.i + i][this.j + j].revealed = true;
            if (grid[this.i + i][this.j + j].value == 0) {
              grid[this.i + i][this.j + j].revealNeighbors(); /* Recursive call */ 
            }                       
          }
          
        }
      }
    }
    
    
    
    
  };
  
  
  
  
  
  
}
