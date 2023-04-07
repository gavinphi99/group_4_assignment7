class Player {

  //Fields
  float x, y; //the current x and y position of the player on screen
  float speed;
  float screenBottomMargin = height / 16.66;
  Sprite sprite;
  
  int moveDirection;
  
  //Constructor
  Player(){
    super();
    //setup
    x = width/2;
    y = height - screenBottomMargin;
    speed = 4;
    
    //TODO: Set up sprite to be drawn instead of placeholder
    
    moveDirection = 0;
  }
  
  //displays the player ship on screen
  void display(){
    //TODO: Make it display a sprite instead of placeholder rectangle
    fill(255);
    rectMode(CENTER);
    rect(x,y,20,20);
  }
  
  //all behavior that runs every frame
  void update(){
    display();
    
    //move
    if (moveDirection == 0) {
      
    }
    else if (moveDirection == 1) {
      moveRight();
    }
    else if (moveDirection == -1) {
      moveLeft();
    }
  }
  
  void keyPressed(){
    println("player registered key pressed");
    if (key == CODED){
      //move left
      if (keyCode == LEFT) {
        println("move left");
        //moveLeft();
        moveDirection = -1;
      }
      //move right
      else if (keyCode == RIGHT) {
        println("move right");
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
