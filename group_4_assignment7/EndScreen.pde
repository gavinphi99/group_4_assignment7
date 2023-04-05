class EndScreen extends ScoreScreens {
  PlayMode play;
  Score current;
  
  EndScreen() {
    super();
    play = new PlayMode();
    current = scoreList.get(scoreList.size()-1);
    
  }
  
  void update() {
    if (play.isDead()) {
      this.insertScore(scoreList.get(scoreList.size()-1));
    }
  }
  
  void display() {
    update();
    textSize(20);
    fill(255);
    for (int i = 0; i < scoreList.size(); i++) {
      text(scoreList.get(i).player + ": " + str(scoreList.get(i).score), 50, 50 + i * 30);
    }
    if (isHigh) {
      text("HIGH SCORE!\n " + str(current.score) + "\nNICE JOB " + current.player, 25, 25);
    } else {
      text("YOU LOSE!\n TRY AGAIN", 25, 25);
    }
  }
  
}
