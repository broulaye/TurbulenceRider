
// put global variables here
Player player;
Audio audioPlayer;
// this function is run before other function by processing.
void setup() {
  size( 1000, 1000); // creates a window that is 1000x1000
  //fullScreen();  // this is fullscreen mode.
  player = new Player();
  audioPlayer.setup();
  
}

// this function is run automatically by processing
// should be synced with framerate variable.
void draw() {
  // update the background
  background(124);
  // draw the player
  player.draw();
  audioPlayer.draw();
}