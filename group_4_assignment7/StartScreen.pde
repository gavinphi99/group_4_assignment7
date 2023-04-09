class StartScreen extends ScoreScreens {
  String inputPlayer;
  boolean startGame;
  
  StartScreen(ArrayList<Score> scoreList) {
    super(scoreList);

    inputPlayer = "";
    startGame = false;
    convert();
    
  }
  
  void addPlayerData() {
    scoreList.add(0, new Score(inputPlayer, 0));
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
    
    textSize(12);
    text("CONTROLS", width/2, height/2 + 125);
    text("LEFT KEY - LEFT", width/2 - 100, height/2 + 150);
    text("RIGHT KEY - RIGHT", width/2 + 100, height/2 + 150);
    text("CTRL - BIG SHOT", width/2 - 100, height/2 + 175);
    text("SPACE - SMALL SHOT", width/2 + 100, height/2 + 175);
      
  }
  
  
  void keyPressed() {  
    //println("start screen registered key pressed");
  
    if (key == '\b' && inputPlayer.length() > 0) {
      inputPlayer = inputPlayer.substring(0, inputPlayer.length() - 1);
    } else if (keyCode == ENTER) {
      addPlayerData();
      startGame = true;
    } else if (inputPlayer.length() < 3 && Character.isLetter(key)) {
        inputPlayer += Character.toUpperCase(key);
    } else {
      inputPlayer += "";
    }

  }
  
  
}
