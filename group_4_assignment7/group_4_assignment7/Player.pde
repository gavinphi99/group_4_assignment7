class Player {

  //Fields
  float x, y; //the current x and y position of the player on screen
  float w, h;
  float speed;
  float screenBottomMargin = height / 16.66;
  Sprite sprite;
  Timer timer;
  
  int moveDirection;
  
  //Constructor
  Player(){
    super();
    //setup
    x = width/2;
    y = height - screenBottomMargin;
    w = 57.4;
    h = 42.63;
    speed = 4;
    
    //TODO: Fix sprite flickering
    sprite = new Sprite("sprite_spaceship", ".png", x, y, w, h, 2, true, new Timer(100, true));
    
    moveDirection = 0;
  }
  
  //displays the player ship on screen
  void display(){
    //placeholder
    /*
    fill(255);
    rectMode(CENTER);
    rect(x,y,20,20);
    */
    
    //draw sprite
    sprite.setX(x);
    sprite.setY(y);
    sprite.display();
  }
  
  //all behavior that runs every frame
  void update(){
    display();
    //move
    if (moveDirection == 0) {
      
    }
    else if (moveDirection == 1 && x + w/2 >= width) {
      moveDirection = 0;
    }
    else if (moveDirection == -1 && x - w/2 <= 0) {
      moveDirection = 0;
    }
    
    if (moveDirection == 1) {
      moveRight();
    }
    
    else if (moveDirection == -1) {
      moveLeft();
    }
  }
    
    
  
  void keyPressed(){
    if (key == CODED){
      //move left
      if (keyCode == LEFT) {
        //println("move left");
        //moveLeft();
        moveDirection = -1;
      }
      //move right
      else if (keyCode == RIGHT) {
        //println("move right");
        //moveRight();
        moveDirection = 1;
      }
    }
  }
  
  void keyReleased(){
    if (keyCode == LEFT || keyCode == RIGHT){
      moveDirection = 0;
    }
  }
  
  void moveLeft(){
    x -= speed;
  }
  void moveRight(){
    x += speed;
  }
}
