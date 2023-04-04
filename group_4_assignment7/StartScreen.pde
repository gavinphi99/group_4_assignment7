class StartScreen extends ScoreScreens {
  String inputPlayer;
  float inputScore;
  Timer timer;
  
  StartScreen() {
    super();
    inputScore = 0.0;
    inputPlayer = "";
    timer = new Timer(Integer.MAX_VALUE, false);
  }
  
  
  void addPlayerData() {
    scoreList.add(new Score(inputPlayer, inputScore));
  }
  
  void run() {
    timer.resume();
    addPlayerData();
    println(scoreList.get(scoreList.size()-1).player);
    println("run game");
  }
  
  void display() {
    textSize(20);
    fill(0);
    textAlign(CENTER, CENTER);
    text("SHAPE INVADERS", width/2, 100);
    text("ENTER PLAYER NAME: " + inputPlayer, width/2, height/2 + 30);
    text("PRESS ENTER TO START", width/2, height/2 + 75);
  }
  
  void keyPressed() {
    if (key == '\b') {
      inputPlayer = inputPlayer.substring(0, inputPlayer.length() - 1);
    } else if (keyCode == ENTER) {
      run();
      
    } else if (inputPlayer.length() < 3 && Character.isLetter(key)) {
        inputPlayer += Character.toUpperCase(key);
    } else {
      inputPlayer += "";
    }
  }
  
  
  
}
