// Platform class (inherits from Tile)
class Platform extends Tile {
  PVector[] path;
  int currentPathIndex;

  Platform(float x, float y, int tileSize, PVector[] path) {
    super(x, y, tileSize);
    this.path = path;
    this.currentPathIndex = 0;
  }

  void updatePosition() {
    int newIndex = turnCount % path.length;
    if (newIndex != currentPathIndex) {
      currentPathIndex = newIndex;
      position.set(path[currentPathIndex]);
    }
  }

  void display() {
    float posX = position.x * tileSize;
    float posY = position.y * tileSize;
    stroke(0);
    fill(0, 128, 255);
    rect(posX, posY, tileSize, tileSize);
  }
}
