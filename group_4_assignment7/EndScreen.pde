class EndScreen extends ScoreScreens {

  EndScreen() {
    super();
  }
  
  void display() {
    textSize(20);
    fill(0);
    for (int i = 0; i < scoreList.size(); i++) {
      text(scoreList.get(i).player + ": " + str(scoreList.get(i).score), 50, 50 + i * 30);
    }
  }
  
}
