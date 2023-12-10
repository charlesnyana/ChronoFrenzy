// Platform tab: encapsulates platform object along with the logic associated with them.
class Platform extends Tile {
  PVector[] path;
  int currentPathIndex;

  Platform(float x, float y, int tileSize, PVector[] path) {
    super(x, y, tileSize);
    this.path = path;
    this.currentPathIndex = 0;
  }

  // Update the platform's position based on turnCount
  void updatePosition() {
    int newIndex = turnCount % path.length;
    if (newIndex != currentPathIndex) {
      currentPathIndex = newIndex;
      position.set(path[currentPathIndex]);
    }
  }

  // Override the display method to visually represent the platform
  void display() {
    float posX = position.x * tileSize;
    float posY = position.y * tileSize;
    stroke(0);
    fill(0, 128, 255); // Light blue color
    rect(posX, posY, tileSize, tileSize);
  }
}


void initPlatform(){
  Platform platform = new Platform(5, 2, tileSize, new PVector[]{new PVector(5, 2), new PVector(5, 1), new PVector(5, 0), new PVector(5, 1)});
  tiles[5][2] = platform;
}

void shiftPlatform(){
  if (tiles[5][2] instanceof Platform) {
    ((Platform) tiles[5][2]).updatePosition();
  }
}
