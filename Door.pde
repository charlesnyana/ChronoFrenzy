// Door tab: encapsulates door object and associates them with a key.
class Door extends Tile {
  boolean isLocked;
  Key associatedKey; // New variable to store the associated key

  Door(float x, float y, int tileSize) {
    super(x, y, tileSize);
    isLocked = true;
  }

  // Method to check if the door is locked
  boolean isLocked() {
    return isLocked;
  }

  // Method to unlock the door (called when the player has the key)
  void unlock() {
    isLocked = false;
  }

  // Override the display method to visually represent the locked/unlocked state
  void display() {
    float posX = position.x * tileSize;
    float posY = position.y * tileSize;
    stroke(0);
    if (isLocked) {
      fill(255, 200, 0); // Display locked doors in grey
    } else {
      fill(255, 200, 0); // Display unlocked doors in yellow
    }
    rect(posX, posY, tileSize, tileSize);
  }

  // Method to set the associated key
  void setKey(Key key) {
    this.associatedKey = key;
  }

  // Return the associated key
  Key getKey() {
    return associatedKey;
  }
  
  // Method to lock door for reset
  void lock() {
    isLocked = true;
  }
}

void initDoors() {
  // Initialize Door objects and place them on the grid
  Door door1 = new Door(6, 8, tileSize);
  Door door2 = new Door(0, 6, tileSize);
  Door door3 = new Door(4, 5, tileSize);

  // Initialize Key objects and place them on the grid
  Key key1 = new Key(9, 9, tileSize);
  Key key2 = new Key(2, 5, tileSize);
  Key key3 = new Key(2, 7, tileSize);

  // Associate each key with its corresponding door
  door1.setKey(key1);
  door2.setKey(key2);
  door3.setKey(key3);

  // Set the associated door for each key
  key1.setAssociatedDoor(door1);
  key2.setAssociatedDoor(door2);
  key3.setAssociatedDoor(door3);

  // Add the doors to the tiles array
  tiles[6][8] = door1;
  tiles[0][6] = door2;
  tiles[4][5] = door3;

  // Add the keys to the tiles array
  tiles[9][9] = key1;
  tiles[2][5] = key2;
  tiles[2][7] = key3;
}
