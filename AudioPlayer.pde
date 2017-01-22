import ddf.minim.*;

class Audio {
  Minim minim;
  AudioPlayer player;
  String musicName;
  int top, distance, current, current1, current2, amp, strokeColor;
  float[] track;
  float lastPow;
  
  // this function is run before other function by processing.
  void setup(PApplet parent) {

    // we pass this to Minim so that it can load files from the data directory
    minim = new Minim(parent);
    musicName = "DrakeOver.mp3";
    // loadFile will look in all the same places as loadImage does.
    // this means you can find files that are in the data folder and the 
    // sketch folder. you can also pass an absolute path, or a URL.
    //player = minim.loadFile(dataPath(musicName));
    player = minim.loadFile(musicName);
    
    distance = height / 4; // distance between the two boarderlines.
    top = (height / 2) - (distance / 2);
    track = new float[width]; // this is the boarderline, length of the width.
    current = 0; // the position where new data is added.
    amp = 1000; // the amplification of the signal.
    lastPow = 0; // the previous amp level
    strokeColor = 255;
    println("player buffer size: " + player.bufferSize());
  }
  
  void draw()
  {
    //background(0);
    
    // setup the lines
    stroke(strokeColor);
    //stroke(map(player.left.get(1000), -1, 1, 0, 255));
    strokeWeight(10);    
    
    // draw the waveforms
    // the values returned by left.get() and right.get() will be between -1 and 1,
    // so we need to scale them up to see the waveform
    // note that if the file is MONO, left.get() and right.get() will return the same value
    //for(int i = 0; i < player.bufferSize() - 1; i++)
    //{
      //float x1 = map( i, 0, player.bufferSize(), 0, width );
      //float x2 = map( i+1, 0, player.bufferSize(), 0, width );
      //line( x1, top + player.left.get(i)*50, x2, top + player.left.get(i+1)*50 );
      //line( x1, top + distance + player.right.get(i)*50, x2, top + distance + player.right.get(i+1)*50 );
      
    //}
    
    if (frameCount % 5 == 0) {
      track[current] = top + player.left.get(1000) * amp;
      lastPow = track[current];
    }
    else {
      track[current] = lastPow;
    }
    for (int i = 0; i < track.length; i++) {
      current1 = (current + 20 + i)%width; // this can be optimized.
      current2 = (current1 + 20) % width;
      line(i, track[current1], i + 20, track[current2]);
      line(i, distance + track[current1], i + 20, distance + track[current2]);
    }
    current = (current + 20) % width; // make the array as circular loop.
    
    // draw a line to show where in the song playback is currently located
    //float posx = map(player.position(), 0, player.length(), 0, width);
    //stroke(0,200,0);
    //line(posx, 0, posx, height);
    
    if ( player.isPlaying() )
    {
      text("Press any key to pause playback.", 10, 20 );
    }
    else
    {
      text("Press any key to start playback.", 10, 20 );
    }
  }
  
  void keyPressed()
  {
    if (key == ' ') {
      if ( player.isPlaying() )
      {
        player.pause();
      }
      // if the player is at the end of the file,
      // we have to rewind it before telling it to play again
      else if ( player.position() == player.length() )
      {
        player.rewind();
        player.play();
      }
      else
      {
        player.play();
      }
    }
  }

}