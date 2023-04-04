class StartScreen extends ScoreScreens {
  String inputPlayer;
  float inputScore;
  Timer timer;
  PlayMode play;
  
  StartScreen() {
    super();
    inputScore = 0.0;
    inputPlayer = "";
    timer = new Timer(Integer.MAX_VALUE, false);
    play = new PlayMode();
  }
  
  boolean atStart() {
    if (timer.start == 0) {
      return true;
    }
    return false;
  }
  
  
  
  void addPlayerData() {
    scoreList.add(new Score(inputPlayer, inputScore));
  }
  
  void startPlay() {
    timer.resume();
    addPlayerData();
    play.run();
  }
  
  void display() {
    
    fill(255);
    textAlign(CENTER, CENTER);
    
    textSize(20);
    text("HIGH SCORE: " + str(scoreList.get(0).score), width/2, 25);
    
    textSize(32);
    text("SHAPE INVADERS", width/2, 175);
    
    textSize(20);
    text("ENTER PLAYER NAME: " + inputPlayer, width/2, height/2 + 30);
    text("PRESS ENTER TO START", width/2, height/2 + 75);
    
  }
  
  
  
  void keyPressed() {
    if (key == '\b') {
      inputPlayer = inputPlayer.substring(0, inputPlayer.length() - 1);
    } else if (keyCode == ENTER) {
      startPlay();
      
    } else if (inputPlayer.length() < 3 && Character.isLetter(key)) {
        inputPlayer += Character.toUpperCase(key);
    } else {
      inputPlayer += "";
    }
  }
  
  
  
}
