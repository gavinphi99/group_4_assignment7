class PlayMode {
  StartScreen start;
  Player player;
  EndScreen end;
  Timer timer, invaderTimer;
  int timeInterval;
  int lives;
  boolean powerup;
  ArrayList<Projectile> projectiles;
  ArrayList<RectInvader> rectInvaders;

  PlayMode(ArrayList<Score> scoreList) {
    lives = 3; // change to positive integer for play testing
    powerup = false; // do something with this
    //println(scoreList);
    start = new StartScreen(scoreList);
    player = new Player();
    end = new EndScreen(scoreList);
    timer = new Timer(Integer.MAX_VALUE, false);
    timeInterval = 1000;
    invaderTimer = new Timer(timeInterval, false);

    projectiles = new ArrayList<Projectile>();
    rectInvaders = new ArrayList<RectInvader>();
  }

  void run() {
    invaderTimer.trigger();
    if (timer.start == 0) {
      start.display();
      if (start.startGame) {
        timer.resume();
      }
    } else if (timer.start != 0 && !isDead()) {
      player.update();
    } else if (timer.start != 0 && isDead()) {
      end.update();
    }
    projectileDisplay();
    invaderDisplay();
  }

  //TODO: sub lives when enemies at bottom of screen
  boolean isDead() {
    if (lives == 0) {
      return true;
    }
    return false;
  }

  void projectileDisplay() {

    //projectiles
    //update all projectiles
    if (projectiles.size() > 0) {
      for (int i = 0; i < projectiles.size(); i++) {
        if (projectiles.get(i) != null) {
          projectiles.get(i).update();
        }
      }
    }
  }

  void invaderDisplay() {
    //timing of the invader release
    //local Variables
    PVector pos;
    PVector vel;
    float currentTime = millis() - timer.start;
    println(invaderTimer.isExecuted);
    if(currentTime <20000 && invaderTimer.isExecuted){
      println(1);
      pos = new PVector((int)random(width), 0);
      vel = new PVector(0, 1);
      rectInvaders.add(new RectInvader(pos, vel, width / 12, height / 16, color(0, 255, 0), 20));
      
      invaderTimer.reset();
    }
    
    if (rectInvaders.size() > 0) {
      for (int i = 0; i < rectInvaders.size(); i++) {
        if (rectInvaders.get(i) != null) {
          rectInvaders.get(i).display();
        }
      }
    }
  }

  void keyPressed() {
    if (timer.start == 0) {
      start.keyPressed();
    } else {
      player.keyPressed();
    }
  }

  void keyReleased() {
    player.keyReleased();

    //firing projectiles
    if (key == ' ') {
      println("fire projectile");
      Projectile p = new Projectile(player.x, player.y);
      projectiles.add(p);
    }
  }
}
