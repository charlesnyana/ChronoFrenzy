//Screens tab: stores the code for the non-game loop screens such as the start, end, and fail screens.
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


void displayFailPrompt() {
  background(255);
  fill(0);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("You're falling. Press 'Space' to use the recall mechanic.", width / 2, height / 2);
}
