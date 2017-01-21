// new tabs can be created and also classes.
// classes are not separate from the main file so
// the scope of the global variables will be available
// to each class.
class Player {
  PVector pos;
  int stepSize;
  int size;
  
  public Player() {
    pos = new PVector();
    pos.x = 50;
    pos.y = height / 2;
    stepSize = 10;
    size = 100;
  }
  
  public void draw() {
    updateMovement();
    checkCollision();
    // this is the current character, need to make a real one.
    ellipse(pos.x, pos.y, size, size);
  }
  
  private void updateMovement() {
    if (keyPressed) {
      if (key == 'w') {
        pos.y -= stepSize;
      }
      else if (key == 's') {
        pos.y += stepSize;
      }
    }
  }
  
  private void checkCollision() {
    if (pos.y < 0)
      pos.y = 0;
    else if (pos.y > height)
      pos.y = height;
  }
}