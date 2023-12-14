//Screens tab: stores the code for the non-game loop screens such as the start, end, and fail screens.
void displayStartScreen() {
  // Display elements for the start screen
  background(200);
  
  // Title
  image(startImg, 0, 0);
}

void displayEndScreen() {
  // Display elements for the end screen
  image(endImg, 0, 0);
  textAlign(CENTER, CENTER);
  textSize(65);
  fill(0);
  text(turnCount + " Turns", width / 2, height / 1.7);
}


void displayFailPrompt() {
  image(failImg, 0, 0);
}
