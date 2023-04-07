class PlayMode {
  StartScreen start;
  Player player;
  EndScreen end;
  Timer timer;
  int lives;
  boolean powerup;
  ArrayList<Projectile> projectiles;
  ArrayList<Invader> invaders;

  PlayMode(ArrayList<Score> scoreList) {
    lives = 3; // change to positive integer for play testing
    powerup = false; // do something with this
    //println(scoreList);
    start = new StartScreen(scoreList);
    player = new Player();
    end = new EndScreen(scoreList);
    timer = new Timer(Integer.MAX_VALUE, false);

    projectiles = new ArrayList<Projectile>();
    invaders = new ArrayList<Invader>();
  }

  void run() {
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
    if(millis() <20000){
    
    }
    
    if (invaders.size() > 0) {
      for (int i = 0; i < invaders.size(); i++) {
        if (invaders.get(i) != null) {
          invaders.get(i).display();
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
