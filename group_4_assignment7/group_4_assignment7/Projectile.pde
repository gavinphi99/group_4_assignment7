class Projectile {
  float x;
  float y;
  float speed;
  
  boolean alive;
  
  Projectile(float xIn, float yIn){
    x = xIn;
    y = yIn;
    speed = 4;
    alive = true;
  }
  
  void update(){
    moveUp();
    display();
    
    //check if projectile has reached top of screen
    if (y < 3) {
      destroy();
    }
  }
  
  void moveUp(){
    y -= speed;
  }
  
  void display(){
    noStroke();
    fill(255);
    rectMode(CENTER);
    rect(x,y,5,5);
  }
  
  //call to make the projectile disappear. happens after taking damage from an enemy or reaching top of screen
  void destroy(){
    alive = false;
  }
}
