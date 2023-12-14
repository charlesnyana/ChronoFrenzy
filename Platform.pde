// Platform tab: encapsulates platform object along with the logic associated with them.
int currentPlatformX;
int currentPlatformY;

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
      //println ("Index: " + currentPathIndex + " Plat pos: (" + position.x + ", " + position.y + ")");
      currentPlatformX = (int) position.x;
      currentPlatformY = (int) position.y;
      println ("Plat pos: (" + currentPlatformX + ", " + currentPlatformY + ")");
    }
  }

  // Override the display method to visually represent the platform
  void display() {
    float posX = 5 * tileSize;
    float posY = position.y * tileSize;
    stroke(0);
    fill(0, 128, 255); // Light blue color
    
    //image(pitTile, posX, posY);
    
    switch(currentPathIndex) {
      case 0:
        image(pitTile1, posX, 0);
        break;
        
        case 1:
        image(pitTile2, posX, 0);
        break;
        
        case 2:
        image(pitTile3, posX, 0);
        break;
        
        case 3:
        image(pitTile2, posX, 0);
        break;
    }
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
