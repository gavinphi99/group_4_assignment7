class Sprite {
  //Written by Leonardo Guardione
  
  int currentFrame, numFrames;
  PImage[] sprite;
  Timer timer;
  boolean loops;
  float x, y, w, h;

  String spriteInitialName, fileType;

  Sprite(String _spriteInitialName, String _fileType, float _x, float _y, float _w, float _h, int _numFrames, boolean _loops, Timer _timer) {
    currentFrame = 0;
    numFrames = _numFrames;
    timer = _timer;
    spriteInitialName = _spriteInitialName;
    fileType = _fileType;
    loops = _loops;
    
    x = _x;
    y = _y;
    w = _w;
    h = _h;

    sprite = new PImage[numFrames];
    
    //setup PImage array into sprite using file name and structured
    for (int i = 0; i < numFrames; i++) {
      String spriteName = spriteInitialName + nf(i+1, 2) + fileType;
      sprite[i] = loadImage(spriteName);
    }
  }
  
  //draws displays the sprite in the correct size and shape at the correct location x, y
  void display() {
    imageMode(CENTER);
    if (timer.trigger() && currentFrame < numFrames) {
      currentFrame += 1;
    }
    if (currentFrame < numFrames) {
      image(sprite[currentFrame], x, y, w, h);
    } else {
      
      //restarts the animation if the sprite loops.
      if (loops) {
        timer.reset();
        currentFrame = 0;
      }
    }
  }
  
  void setX(float _x){
    x = _x;
  }
  
  void setY(float _y){
    y = _y;
  }
  
}

/*SAMPLE SETUP OF A SPRITE
 Sprite firecracker;
 
 void setup() {
 size(480, 480);
 firecracker = new Sprite("double_firecracker_", ".gif", 9, true, new Timer(100, true));
 }
 
 void draw() {
 background(255);
 firecracker.display();
 }
 */
