StartScreen start_screen;
EndScreen end_screen;

void setup() {
  size(500, 500);
  start_screen = new StartScreen();
  end_screen = new EndScreen();
  
}

void draw() {
  background(255);
  start_screen.display();
}

void keyPressed() {
  start_screen.keyPressed();
}
