class Platform extends Tile {
  PVector[] path;
  int currentPathIndex;
  boolean isActive;

  Platform(float x, float y, int tileSize, PVector[] path) {
    super(x, y, tileSize);
    this.path = path;
    this.currentPathIndex = 0;
    this.isActive = false;

    // Mark tiles on the path as pits
    for (PVector p : path) {
      tiles[(int) p.x][(int) p.y].isPit = true;
    }
  }

  // Method to update the platform's position based on turnCount
  void updatePosition() {
    int newIndex = turnCount % path.length;
    if (newIndex != currentPathIndex) {
      currentPathIndex = newIndex;
      position.set(path[currentPathIndex]);
      isActive = true; // Activate the platform when it moves
    }
  }

  // Method to check if the platform is active
  boolean isActive() {
    return isActive;
  }

  // Method to deactivate the platform
  void deactivate() {
    isActive = false;
  }

  // Override the display method to visually represent the platform
  void display() {
    float posX = position.x * tileSize;
    float posY = position.y * tileSize;
    stroke(0);

    if (isActive) {
      fill(0, 128, 255); // Light blue color for active platform
    } else {
      fill(200); // Gray color for inactive platform
    }

    rect(posX, posY, tileSize, tileSize);
  }
}
void shiftPlatform(){
  if (tiles[5][2] instanceof Platform) {
    ((Platform) tiles[5][2]).updatePosition();
  }
}
