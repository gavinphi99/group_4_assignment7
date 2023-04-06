class PlayMode {
  StartScreen start;
  Player player;
  EndScreen end;
  Timer timer;
  int lives;
  boolean powerup;
  
  PlayMode(ArrayList<Score> scoreList) {
    lives = 0;
    powerup = false;
    //println(scoreList);
    start = new StartScreen(scoreList);
    player = new Player();
    end = new EndScreen(scoreList);
    timer = new Timer(Integer.MAX_VALUE, false);
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
    if (timer.start == 0) {
      start.display();
      if (start.startGame) {
        timer.resume();
      }
    }
    else if (timer.start != 0 && !isDead()){
      player.update();
    } else if (timer.start != 0 && isDead()){
      end.update();
    }
    
  }
  
  void keyPressed() {
    if (timer.start == 0) {
      start.keyPressed();
    } else {
      player.keyPressed();
    }
  }
  
}
