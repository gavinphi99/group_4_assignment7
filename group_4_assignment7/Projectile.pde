class Projectile {
  float x;
  float y;
  float speed;
  
  Projectile(float xIn, float yIn){
    x = xIn;
    y = yIn;
    speed = 4;
  }
  
  void update(){
    moveUp();
    display();
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
}
