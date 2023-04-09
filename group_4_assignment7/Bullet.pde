class Bullet {
  float x;
  float y;
  float speed;
  float damage; //the damage value to be applied to the enemy
  
  BulletType type;
  
  boolean alive;
  int maxHealth;
  int currHealth;
  
  float smallDamage = 1;
  float bigDamage = 3;
  
  Bullet(float xIn, float yIn, BulletType typeIn){
    x = xIn;
    y = yIn;
    type = typeIn;
    
    //set variables based on bullet type
    if (type == BulletType.SMALL){
      speed = 6;
      maxHealth = 1;
      damage = smallDamage;
    }
    else if (type == BulletType.BIG){
      speed = 2;
      maxHealth = 3;
      damage = bigDamage;
    }
    
    //set current health to max health to start
    currHealth = maxHealth;
    
    //set bullet status to alive
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
    rectMode(CENTER);
    if (type == BulletType.SMALL){
      noStroke();
      fill(255);
      rect(x,y,5,5);
    }
    if (type == BulletType.BIG){
      noStroke();
      fill(255,0,0);
      rect(x,y,10,10);
    }
  }
  
  //call to make the projectile disappear. happens after taking damage from an enemy or reaching top of screen
  void destroy(){
    alive = false;
  }
  
  void reduceHealth(){
    currHealth -= 1;
    
    //check if shot should be destroyed
    if (currHealth <= 0) {
      destroy();
    }
  }
}
