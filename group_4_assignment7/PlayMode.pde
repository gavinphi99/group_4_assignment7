class PlayMode {
  
  int lives;
  boolean powerup;
  
  PlayMode() {
    lives = 0;
    powerup = false;
  }
  
  void run() {
  }
  
  //TODO: no more lives
  boolean isDead() {
    if (lives == 0) {
      return true;
    }
    return false;
  }
  
  void display() {
  }
  
  
}
