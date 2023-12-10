//Main tab: Display functions of the main game loop and global functions used across multiple objects.

int tileSize = 40; //Size of each tile
int numRows = 10; //Number of rows
int numCols = 10; //Number of columns

int turnCount = 0;
PVector[] playerHistory = new PVector[]{new PVector(0, 9), new PVector(0, 9), new PVector(0, 9), new PVector(0, 9), new PVector(0, 9)};

ArrayList<PVector> wallCoordinates;

// Game states
boolean startScreen = true;
boolean fail = false;
boolean endScreen = false;

//Events
boolean teleportationOccurred = false;
boolean trapOccured = false;
int recallCooldown = 4;


//Objects
Tile[][] tiles; // 2D object array to store tile objects
Player player; //Declares player as a Tile object
Wall walls;
Door door;
Key keys;


void setup() {
  size(400, 400);
  initGame();
}

void draw() {
  if (startScreen) {
    displayStartScreen();
  } else if (endScreen) {
    displayEndScreen();
  } else {
    if (!fail) {
      displayGame();
      if (player.position.x == 4 && player.position.y == 5) { //checks for win condition
        endScreen = true;
      }
    } else {
      // Display a message or prompt for using the recall mechanic
      displayFailPrompt();
    }
  }
}

void displayGame() {
  background(255);
  displayGrid();
  shiftPlatform();
  
  recallTrail();
  player.display();
  turnCountCounter();

  fill(173, 216, 230); // Will be its own thing later
  stroke(0);
  rect(4 * tileSize, 4 * tileSize, 2 * tileSize, 2 * tileSize);
}

// M1: This function displays the map
void displayGrid() {
  // Display the grid of tiles
  for (int i = 0; i < numRows; i++) {
    for (int j = 0; j < numCols; j++) {
      rectMode(CORNER);
      stroke(0); // Stroke color (black border)
      
      // Check if the tile is a wall and fill it with black color
      if (tiles[i][j] instanceof Wall) {
        fill(0);
      } else if (tiles[i][j] instanceof Door) {
        fill(255, 255, 0); // Yellow for doors
      } else {
        noFill();
      }

      rect(i * tileSize, j * tileSize, tileSize, tileSize);
      tiles[i][j].display();
    }
  }
}

void turnCountCounter() {
// Display turn count at the top right
  fill(0);
  textSize(16);
  textAlign(RIGHT, TOP);
  text("Turn Count: " + turnCount, width - 10, 10);
}
  

//M1: RECALL Trail (shows player's last 4 movements)
void recallTrail() {
  for (int i = 0; i < 4; i++) {
    if (playerHistory[i] != null) {
      PVector position = playerHistory[i];

      float alpha = map(i, 0, 3, 191, 25);

      fill(255, 50, 50, alpha);
      noStroke();
      ellipse(position.x * tileSize + tileSize / 2, position.y * tileSize + tileSize / 2, tileSize, tileSize);
    }
  }
}

void resetGame() {
  endScreen = false;
  startScreen = true;
  trapOccured = false;
  teleportationOccurred = false;
  turnCount = 0;
  recallCooldown = 4;

  //re-initalizes game to original state
  initGame();

  // Reset the player position and history
  player.position.x = 0;
  player.position.y = 9;
  for (int i = 0; i <= 4; i++) {
    playerHistory[i].x = 0;
    playerHistory[i].y = 9;
  }

  // Redraw the game
  redraw();
}
