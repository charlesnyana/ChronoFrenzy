// Wall tab: encapsulates wall object along with the logic associated with them.
class Wall extends Tile {
  Wall(float x, float y, int tileSize) {
    super(x, y, tileSize);
  }

  // You can add additional methods or properties specific to the Wall class if needed
// This method displays the wall
  void display() {
    float posX = position.x * tileSize;
    float posY = position.y * tileSize;
    stroke(0);
    fill(0);
    image(wallTile, posX, posY, tileSize, tileSize);
  }
}


//Walls are at (XY)
//(0,8) (1,8) (2,8) (3,8) (4,8) (5,8) (7,8) (1,8)
void initWalls() {
  wallCoordinates = new ArrayList<PVector>();
  
  wallCoordinates.add(new PVector(0, 8)); // I understand I could make an array that store these values to clean this up, but I find
  wallCoordinates.add(new PVector(1, 8)); // that it's easier to keep track of the coordinates this way for now. I will consider cleaning
  wallCoordinates.add(new PVector(2, 8)); // up the code when I finish.
  wallCoordinates.add(new PVector(3, 8));
  wallCoordinates.add(new PVector(4, 8));
  wallCoordinates.add(new PVector(5, 8));
  wallCoordinates.add(new PVector(7, 8));
  wallCoordinates.add(new PVector(8, 8));
  wallCoordinates.add(new PVector(9, 8));
  wallCoordinates.add(new PVector(5, 7));
  wallCoordinates.add(new PVector(5, 6));
  wallCoordinates.add(new PVector(6, 6));
  wallCoordinates.add(new PVector(7, 6));
  wallCoordinates.add(new PVector(7, 5));
  wallCoordinates.add(new PVector(6, 5));
  wallCoordinates.add(new PVector(6, 4));
  wallCoordinates.add(new PVector(7, 4));
  wallCoordinates.add(new PVector(7, 3));
  wallCoordinates.add(new PVector(6, 3));
  wallCoordinates.add(new PVector(6, 2));
  wallCoordinates.add(new PVector(7, 2));
  wallCoordinates.add(new PVector(5, 3));
  wallCoordinates.add(new PVector(4, 2));
  wallCoordinates.add(new PVector(4, 3));
  wallCoordinates.add(new PVector(4, 1));
  wallCoordinates.add(new PVector(3, 1));
  wallCoordinates.add(new PVector(3, 2));
  wallCoordinates.add(new PVector(2, 2));
  wallCoordinates.add(new PVector(1, 2));
  wallCoordinates.add(new PVector(3, 3));
  wallCoordinates.add(new PVector(3, 4));
  wallCoordinates.add(new PVector(2, 4));
  wallCoordinates.add(new PVector(1, 4));
  wallCoordinates.add(new PVector(1, 5));
  wallCoordinates.add(new PVector(1, 6));
  wallCoordinates.add(new PVector(2, 6));
  wallCoordinates.add(new PVector(3, 6));
  
// Create Wall objects and place them on the grid
  for (PVector wallCoordinate : wallCoordinates) {
    int x = (int) wallCoordinate.x;
    int y = (int) wallCoordinate.y;
    tiles[x][y] = new Wall(x, y, tileSize);
  }
}
