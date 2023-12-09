// Platform class (inherits from Tile)
class Platform extends Tile {

  PVector[] path;
  int currentPathIndex;

  // Constructor
  Platform(float x, float y, int tileSize, PVector[] path) {
    super(x, y, tileSize);
    this.path = path;
    this.currentPathIndex = 0;
  }

  // Will add methods to update platform position and display the platform
}
