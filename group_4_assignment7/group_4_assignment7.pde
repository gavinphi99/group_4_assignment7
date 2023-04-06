StartScreen start_screen;
EndScreen end_screen;
PlayMode play;
ArrayList<Score> scoreList;

void setup() {
  size(500, 500);
  scoreList = new ArrayList();
  println(scoreList);
  //start_screen = new StartScreen(scoreList);
  play = new PlayMode(scoreList);
  //end_screen = new EndScreen(scoreList);
}

void draw() {
  background(0);
  //start_screen.display();
  play.display();
  //end_screen.display();
}

void keyPressed() {
  play.keyPressed();
  //if (start_screen.atStart()) {
  //  start_screen.keyPressed();
  //}
  //else {
  //  // Game commands
  //}
  
}
