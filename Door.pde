// Door class (inherits from Tile)
class Door extends Tile {

  boolean isLocked;
  Key associatedKey; // New variable to store the associated key

  // Constructor
  Door(float x, float y, int tileSize) {
    super(x, y, tileSize);
    isLocked = true;
  }

  // Will add other methods specific to the Door class (e.g., unlock, setKey, etc.)
}
