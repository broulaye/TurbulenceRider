// new tabs can be created and also classes.
// classes are not separate from the main file so
// the scope of the global variables will be available
// to each class.
class Player {
  PVector pos;
  
  public Player() {
    pos = new PVector();
  }
  
  public void draw() {
    updateMovement();
    // this is the current character, need to make a real one.
    ellipse(20, pos.y, 10, 10);
  }
  
  private void updateMovement() {
    if (keyPressed) {
      if (key == 'w') {
        pos.y--;
      }
      else if (key == 's') {
        pos.y++;
      }
    }
  }
}