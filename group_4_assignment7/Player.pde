class Player {

  //Fields
  float x; float y; //the current x and y position of the player on screen
  float speed;
  float screenBottomMargin = 30;
  Sprite sprite;
  
  //Constructor
  Player(){
    //setup
    x = width/2;
    y = height - screenBottomMargin;
    speed = 2;
    //TODO: Set up sprite to be drawn instead of placeholder
  }
  
  //displays the player ship on screen
  void display(){
    //TODO: Make it display a sprite instead of placeholder rectangle
    rectMode(CENTER);
    rect(x,y,20,20);
  }
  
  //all behavior that runs every frame
  void update(){
    display();
  }
  
  void keyPressed(){
    println("player registered key pressed");
    if (key == CODED){
      //move left
      if (keyCode == LEFT) {
        println("move left");
        moveLeft();
      }
      //move right
      else if (keyCode == RIGHT) {
        println("move right");
        moveRight();
      }
    }
  }
  
  void moveLeft(){
    x -= speed;
  }
  void moveRight(){
    x += speed;
  }
}
