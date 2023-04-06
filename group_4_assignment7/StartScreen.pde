class StartScreen extends ScoreScreens {
  String inputPlayer;
  float inputScore;
  boolean startGame;
  
  StartScreen(ArrayList<Score> scoreList) {
    super(scoreList);
    inputScore = 3.0;
    inputPlayer = "";
    startGame = false;
    convert();
  }
  
  void addPlayerData() {
    scoreList.add(0, new Score(inputPlayer, inputScore));
    //println(scoreList.get(scoreList.size()-1));
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
    println("start screen registered key pressed");
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
    
    //TODO: this probably shouldn't be contained here, but just testing for now
    //PLAY MODE
    //player.keyPressed();
  }
  
  //everything that happens every frame
  //void update(){
  //  player.update();
  //}
  
}
