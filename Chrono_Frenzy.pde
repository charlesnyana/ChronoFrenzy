int tileSize = 40; //Size of each tile
int numRows = 10; //Number of rows
int numCols = 10; //Number of columns

int turnCount = 0;
PVector[] playerHistory = new PVector[]{new PVector(0, 9), new PVector(0, 9), new PVector(0, 9), new PVector(0, 9), new PVector(0, 9)};


//Objects
Tile[][] tiles; // 2D object array to store tile objects
Player player; //Declares player as a Tile object


void setup() {
  size(400, 400);
  initGrid();
  player = new Player(0, 9, tileSize);
  
   // Initialize each element of playerHistory with a new PVector instance
  for (int i = 0; i < playerHistory.length; i++) {
    playerHistory[i] = new PVector(player.position.x, player.position.y);
  }
}

void draw() {
  background(255);
  displayGrid();
  player.display();
  recallTrail();  
}

//M1: This function initializes the map
void initGrid() {
  tiles = new Tile[numCols][numRows]; // Generates the base grid. mostly as a guide for me but also the the map overlay
  for (int i = 0; i < numRows; i++) {
    for (int j = 0; j < numCols; j++) {
      tiles[i][j] = new Tile(i, j, tileSize);
    }
  }
}

//M1: This function displays the map
void displayGrid() {
  //Display the grid of tiles
 for (int i = 0; i < numRows; i++) {
    for (int j = 0; j < numCols; j++) {
      rectMode(CORNER);
      stroke(0); // Stroke color (black border)
      rect(i * tileSize, j * tileSize, tileSize, tileSize);
      tiles[i][j].display();
    }
  }
}

  

//M1: RECALL mechanic (return mechanic in game plan but avoiding the word 'return' for the program)
void recallTrail() {
  for (int i = 1; i <= 4; i++) {
    if (playerHistory[i] != null) {
      PVector position = playerHistory[i];
      
      // Calculate alpha based on the position index
      float alpha = map(i, 1, 4, 191, 25);
      
      fill(255, 0, 0, alpha); // Red color with variable alpha
      noStroke();
      ellipse(position.x * tileSize + tileSize / 2, position.y * tileSize + tileSize / 2, tileSize, tileSize);
    }
  }
}

void recallMove() {
  // Check if playerHistory[4] is not null before using it
  if (playerHistory[4] != null) {
    player.position.x = playerHistory[4].x;
    player.position.y = playerHistory[4].y;

    // Shift the remaining positions
    for (int i = playerHistory.length - 1; i > 0; i--) {
      // Check if playerHistory[i - 1] is not null before copying
      if (playerHistory[i - 1] != null) {
        playerHistory[i] = playerHistory[i - 1].copy();
      } else {
        playerHistory[i] = null; // Set null if the previous position is null
      }
    }

    // Set index 0 to the current player position
    playerHistory[0] = new PVector(player.position.x, player.position.y);
  }
}



//Game controls
void keyPressed() {
  if (keyCode == 'A' || keyCode == 'a') {
    player.move(-1, 0); //the function is in Player object. This function will check for collision in by M2. It will also update turnCount.
    } else if (keyCode == 'D' || keyCode == 'd') {
      player.move(1, 0);
    } else if (keyCode == 'W' || keyCode == 'w') {
      player.move(0, -1);
    } else if (keyCode == 'S' || keyCode == 's') {
      player.move(0, 1);
    } else if (keyCode == ' ' || key == ' ') {
      recallMove();
      for (int i = 0; i < playerHistory.length; i++) {
      playerHistory[i] = null;
      }
    }
}
