// Controls tab: contains the code for player input along with the RECALL mechanic.
void keyPressed() {
  controls(keyCode);
}

void controls(int key) {
  switch (key) {
    case ENTER:
      if (startScreen) {
        startScreen = false;
      } else if (endScreen) {
        resetGame();
      }
      break;

    case 'A':
    case 'a':
      if (!fail) {
        player.movePlayer(-1, 0);
        face = 0;
      }
      break;

    case 'D':
    case 'd':
      if (!fail) {
        player.movePlayer(1, 0);
        face = 1;
      }
      break;

    case 'W':
    case 'w':
      if (!fail) {
        player.movePlayer(0, -1);
        face = 2;
      }
      break;

    case 'S':
    case 's':
      if (!fail) {
        player.movePlayer(0, 1);
        face = 3;
      }
      break;
    
    case 'R':
    case 'r':
      if (!fail) {
        resetGame();
      }
      break;
    
    case ' ':
      if (!fail) {
        recallMove();
      } else {
        handleFailKeys();
      }
      break;
  }
}

//To allow players to recall when in a fail state
void handleFailKeys() {
  if (keyCode == ' ' || key == ' ') {
    // Perform recall mechanic
    recallCooldown = 0;
    recallMove();
    // Reset the fail state
    fail = false;
  }
}
void recallMove() {
  // Check if there are at least four turns recorded in playerHistory
  if (recallCooldown <= 0) {
    // Store the player's position in the playerHistory array
    playerHistory[0] = new PVector(player.position.x, player.position.y);

    // Shift the existing positions to make room for the new one
    for (int i = playerHistory.length - 1; i > 0; i--) {
      if (playerHistory[i - 1] != null) {
        playerHistory[i] = playerHistory[i - 1].copy();
      } else {
        playerHistory[i] = null; // Set null if the previous position is null
      }
    }
    // Move the player to the position four turns back
    player.position.x = playerHistory[4].x;
    player.position.y = playerHistory[4].y;

    // Update the player history to maintain the trail
    for (int i = 4; i > 0; i--) {
      playerHistory[i] = playerHistory[i - 1].copy();
    }

    // Set index 0 to the current player position
    playerHistory[0] = new PVector(player.position.x, player.position.y);
    
    // Recall cooldown resets
    recallCooldown = 4;
  }
}
