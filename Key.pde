// Key class (inherits from Tile)
class Key extends Tile {

  Door associatedDoor; // New variable to store the associated door
  boolean isCollected;

  // Constructor
  Key(float x, float y, int tileSize) {
    super(x, y, tileSize);
    this.isCollected = false;
  }

  // Will add other methods specific to the Key class (e.g., setAssociatedDoor, isCollected, etc.)
}
