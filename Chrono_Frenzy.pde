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


//Objects
Tile[][] tiles; // 2D object array to store tile objects
Player player; //Declares player as a Tile object
Wall walls;
Door door;
Key keys;


void setup() {
  size(400, 400);
  initGrid();
  initWalls(); //in Walls object
  initDoors();
  initPlatform();
  player = new Player(0, 9, tileSize);
  
   // Initialize each element of playerHistory with a new PVector instance
  for (int i = 0; i < playerHistory.length; i++) {
    playerHistory[i] = new PVector(player.position.x, player.position.y);
  }
}

void draw() {
  if (startScreen) {
    displayStartScreen();
  } else if (endScreen) {
    displayEndScreen();
  } else {
    if (!fail) {
      displayGame();
      if (player.position.x == 4 && player.position.y == 5) {
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


//M1: This function initializes the map
void initGrid() {
  tiles = new Tile[numCols][numRows]; // Generates the base grid. mostly as a guide for me but also the the map overlay
  for (int i = 0; i < numRows; i++) {
    for (int j = 0; j < numCols; j++) {
      tiles[i][j] = new Tile(i, j, tileSize);
    }
  }
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
  

//M1: RECALL mechanic (return mechanic in game plan but avoiding the word 'return' for the program)
void recallTrail() {
  //println("Recalling Trail...");
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



void recallMove() {
  // Check if there are at least four turns recorded in playerHistory
  if (turnCount >= 4) {
    // Move the player to the position four turns back
    player.position.x = playerHistory[4].x;
    player.position.y = playerHistory[4].y;

    // Update the player history to maintain the trail
    for (int i = 4; i > 0; i--) {
      playerHistory[i] = playerHistory[i - 1].copy();
    }

    // Set index 0 to the current player position
    playerHistory[0] = new PVector(player.position.x, player.position.y);
  }
}

void displayStartScreen() {
  // Display elements for the start screen
  background(200);
  
  // Title
  fill(0);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("Chrono-Frenzy", width / 2, height / 3);
  
  // Instructions or start message
  textSize(20);
  text("Press 'Enter' to Start", width / 2, height / 2);
}

void displayEndScreen() {
  // Display elements for the end screen
  background(200); // Change the background color or display an image
  
  // Game over message
  fill(0);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("Game Over", width / 2, height / 4);
  
  // Display player's final score or other relevant information
  textSize(20);
  text("You finished the level in " + turnCount + " turns.", width / 2, height / 3);
  text("Press the 'Enter' key to restart.", width / 2, height / 2);
}

void resetGame() {
  teleportationOccurred = false;
  turnCount = 0;

  // Clear the tiles array and initialize the grid
  initGrid();

  // Place keys and doors in their initial positions
  Door door1 = new Door(6, 8, tileSize);
  Door door2 = new Door(0, 6, tileSize);
  Key key1 = new Key(9, 9, tileSize);
  Key key2 = new Key(2, 5, tileSize);

  // Associate each key with its corresponding door
  door1.setKey(key1);
  door2.setKey(key2);

  // Set the associated door for each key
  key1.setAssociatedDoor(door1);
  key2.setAssociatedDoor(door2);

  // Add the doors and keys to the tiles array
  tiles[6][8] = door1;
  tiles[0][6] = door2;
  tiles[9][9] = key1;
  tiles[2][5] = key2;

  // Place walls
  initWalls();

  // Place the platform
  initPlatform();

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

void handleFailKeys() {
  if (keyCode == ' ' || key == ' ') {
    // Perform recall mechanic
    recallMove();
    // Reset the fail state
    fail = false;
  }
}

void displayFailPrompt() {
  background(255);
  fill(0);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("You're falling. Press 'Space' to use the recall mechanic.", width / 2, height / 2);
}


//Game controls
void keyPressed() {
  if (startScreen && keyCode == ENTER) {
    startScreen = false;
  } else if (endScreen && keyCode == ENTER) {
    // Restart the game to go back to the start screen
    turnCount = 0;
    player.position.x = 0;
    player.position.y = 9;
    for (int i = 0; i <= 4; i++) {
      playerHistory[i].x = 0;
      playerHistory[i].y = 9;
    }
    
    resetGame(); // Finally added reset function
    
    startScreen = true;   
    endScreen = false;
  } else {
    if (!fail) {
      // Check for movement keys and handle player movement
      if (keyCode == 'A' || keyCode == 'a') {
      player.movePlayer(-1, 0);
    } else if (keyCode == 'D' || keyCode == 'd') {
      player.movePlayer(1, 0);
    } else if (keyCode == 'W' || keyCode == 'w') {
      player.movePlayer(0, -1);
    } else if (keyCode == 'S' || keyCode == 's') {
      player.movePlayer(0, 1);
      }
      
      // Check if the player is on a key tile
      Tile playerTile = tiles[(int) player.position.x][(int) player.position.y];
      if (playerTile instanceof Key) {
        Key key = (Key) playerTile;
        if (!key.isCollected()) {
          // Unlock the associated door
          if (key.hasDoor()) {
            key.getDoor().unlock();
            // Removes key from grid
            tiles[(int) player.position.x][(int) player.position.y] = new Tile(player.position.x, player.position.y, tileSize);
            // Set the key as collected
            key.setCollected(true);
          }
        }
      }
    } else {
      // Handle keys when fail is true
      handleFailKeys();
    }
    if (keyCode == ' ' || key == ' ') {
      player.updatePlayerHistory();
      recallMove();
    }
  }
}
