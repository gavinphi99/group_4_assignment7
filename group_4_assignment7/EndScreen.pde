class EndScreen extends ScoreScreens {
  boolean on;
  float highScore;
  Score current;
  EndScreen(ArrayList <Score> scoreList) {
    super(scoreList);
    on = true;
  }
  
  void update() {
    //println(scoreList);
    if (on) {
      current = scoreList.get(0);
      checkScore();
      highScore = scoreList.get(0).score;
      saveScore();
      on = false;
    }
    else {
      display();
    }
    //println(scoreList.get(0).score);
    
    
  }
  
  void display() {
    
    textSize(20);
    fill(255);
    println(scoreList.get(0).score);
    scoreList.get(0).score = highScore;
    for (int i = 0; i < scoreList.size(); i++) {
      text(scoreList.get(i).player + ": " + str(scoreList.get(i).score), width/2, height/2 + i * 30);
    }
    
    if (isHigh) {
      text("HIGH SCORE!\n SCORE: " + str(current.score) + "\nNICE JOB " + current.player, width/2, height/2 - 100);
    } else {
      text("YOU LOSE!\n TRY AGAIN", width/2, height/2 - 100);
    }
    
  }
  
}
