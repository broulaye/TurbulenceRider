// new tabs can be created and also classes.
// classes are not separate from the main file so
// the scope of the global variables will be available
// to each class.
class Player {
  PVector pos;
  
  public Player() {
    pos = new PVector();
  }
  
}