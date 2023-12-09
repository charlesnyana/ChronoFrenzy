// Main code tab
int tileSize = 40; // Size of each tile
int numRows = 10; // Number of rows
int numCols = 10; // Number of columns

int turnCount = 0;
PVector[] playerHistory = new PVector[]{new PVector(0, 9), new PVector(0, 9), new PVector(0, 9), new PVector(0, 9), new PVector(0, 9)};

ArrayList<PVector> wallCoordinates;

// Game states
boolean startScreen = true;
boolean fail = false;
boolean endScreen = false;

// Events
boolean teleportationOccurred = false;

// Objects
Tile[][] tiles; // 2D object array to store tile objects
Player player; // Declares player as a Tile object
Wall walls;
Door door;
Key keys;
Platform platform;

void setup() {
  size(400, 400);
  initGame();
}

// Main game loop
void draw() {
  if (startScreen) {
    displayStartScreen();
  } else if (endScreen) {
    displayEndScreen();
  } else {
    displayGame();
    checkGameOver();
    handleFailState();
  }
}

// Function to check game over conditions
void checkGameOver() {
  // Check if the player reached the end
  if (player.position.x == 4 && player.position.y == 5) {
    gameOver("You finished the level in " + turnCount + " turns.");
  }
  // Will add more game over functions for loss conditions (perhaps).
}

// Function to handle game over
void gameOver(String message) {
  background(200); // Change the background color or display an image
  
  // Game over message
  fill(0);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("Game Over", width / 2, height / 4);
  
  // Display player's final score or other relevant information
  textSize(20);
  text(message, width / 2, height / 3);
  text("Press the 'Enter' key to restart.", width / 2, height / 2);
  
  // Handle game over logic here (reset game state)
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

// Function to initialize the game
void initGame() {
  initGrid();
  initWalls();
  initDoors();
  initPlatform();
  player = new Player(0, 9, tileSize);

  // Initialize each element of playerHistory with a new PVector instance
  for (int i = 0; i < playerHistory.length; i++) {
    playerHistory[i] = new PVector(player.position.x, player.position.y);
  }
}

void handleFailState() {
  if (fail) {
    displayFailPrompt();
  }
}

// Function to handle fail state display
void displayFailPrompt() {
  background(255);
  fill(0);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("You're falling. Press 'Space' to Recall.", width / 2, height / 2);
}

void shiftPlatform() {
  if (tiles[5][2] instanceof Platform) {
    ((Platform) tiles[5][2]).updatePosition();
    player.shiftPlatform((Platform) tiles[5][2]);
  }
}

// Controls
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
    // Check if the player is in a fail state
    if (!fail) {
      // Check for movement keys and handle player movement
      if (keyCode == 'A' || keyCode == 'a') {
        player.moveAndTrack(-1, 0, platform);
      } else if (keyCode == 'D' || keyCode == 'd') {
        player.moveAndTrack(1, 0, platform);
      } else if (keyCode == 'W' || keyCode == 'w') {
        player.moveAndTrack(0, -1, platform);
      } else if (keyCode == 'S' || keyCode == 's') {
        player.moveAndTrack(0, 1, platform);
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
