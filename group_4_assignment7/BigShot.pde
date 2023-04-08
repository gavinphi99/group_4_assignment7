class BigShot extends Projectile {
  
  int maxHealth;
  int currHealth;
  
  BigShot(float xIn, float yIn, int healthIn){
    super(xIn, yIn);
    maxHealth = healthIn;
    currHealth = maxHealth;
    
    //speed is slower than standard shot
    speed = 3;
  }
  
  void display(){
    noStroke();
    fill(255,0,0);
    rectMode(CENTER);
    rect(x,y,10,10);
  }
  
  void reduceHealth(){
    currHealth -= 1;
    
    //check if shot should be destroyed
    if (currHealth <= 0) {
      destroy();
    }
  }
}
