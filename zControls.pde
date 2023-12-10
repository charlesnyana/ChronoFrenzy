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
      }
      break;

    case 'D':
    case 'd':
      if (!fail) {
        player.movePlayer(1, 0);
      }
      break;

    case 'W':
    case 'w':
      if (!fail) {
        player.movePlayer(0, -1);
      }
      break;

    case 'S':
    case 's':
      if (!fail) {
        player.movePlayer(0, 1);
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
    recallMove();
    // Reset the fail state
    fail = false;
  }
}
void recallMove() {
  // Check if there are at least four turns recorded in playerHistory
  if (recallCooldown <= 0) {
    player.updatePlayerHistory();
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
