PlayMode play;
ArrayList<Score> scoreList;

void setup() {
  size(500, 500);
  scoreList = new ArrayList();
  play = new PlayMode(scoreList);
}

void draw() {
  background(0);
  play.display();
}

void keyPressed() {
  play.keyPressed();
  
}
