StartScreen start_screen;
EndScreen end_screen;
PlayMode play;

void setup() {
  size(500, 500);
  start_screen = new StartScreen();
  end_screen = new EndScreen();
}

void draw() {
  background(0);
  if 
  start_screen.display();
  end_screen.display();
}

void keyPressed() {
  if (start_screen.atStart()) {
    start_screen.keyPressed();
  }
  else {
    // Game commands
  }
  
}
