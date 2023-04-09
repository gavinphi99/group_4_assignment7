class PlayMode {
  StartScreen start;
  Player player;
  EndScreen end;
  Timer timer, invaderTimer;
  int timeInterval;
  int lives;
  boolean powerup;
  ArrayList<Bullet> bullets;
  ArrayList<BigShot> bigShots;
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

    bullets = new ArrayList<Bullet>();
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

    bulletDisplay();
    invaderMain();
  }

  //TODO: sub lives when enemies at bottom of screen
  boolean isDead() {
    if (lives == 0) {
      return true;
    }
    return false;
  }

  void bulletDisplay() {

    //bullets
    //update all standard bullets
    if (bullets.size() > 0) {
      for (int i = 0; i < bullets.size(); i++) {
        if (bullets.get(i) != null) {
          //if the bullet is still alive, update it
          if (bullets.get(i).alive) {
            bullets.get(i).update();
          }
          //otherwise, remove it from the ArrayList
          else {
            bullets.remove(i);
          }
        }
      }
    }
  }

  void invaderMain() {
    invaderTiming();
    invaderScan();
  }

  void invaderTiming() {
    //timing of the invader release
    //local Variables
    PVector pos;
    PVector vel;
    float currentTime = millis() - timer.start;
    println(invaderTimer.isExecuted);
    if (currentTime <40000 && invaderTimer.isExecuted) {
      println(1);
      pos = new PVector((int)random(width), 0);
      vel = new PVector(0, 1);
      rectInvaders.add(new RectInvader(pos, vel, width / 12, height / 16, color(0, 255, 0), 20));

      invaderTimer.reset();
    } else if (currentTime <80000 && invaderTimer.isExecuted) {
      println(1);
      pos = new PVector((int)random(width), 0);
      vel = new PVector(0, .5);
      rectInvaders.add(new RectInvader(pos, vel, width / 12, height / 16, color(255, 0, 0), 40));

      invaderTimer.reset();
    }
  }

  //everything that should happen when looking at every single 
  void invaderScan() {
    if (rectInvaders.size() > 0) {
      for (int i = 0; i < rectInvaders.size(); i++) {
        if (rectInvaders.get(i) != null) {
          //display the invader
          rectInvaders.get(i).display();

          //register if they got hit
          for (int j = 0; i <= bullets.size(); j++) {
            //if the projectile hits the block
            //if(rectInvaders.get(i).wasHit()){
          }
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

    //firing bullets
    if (key == ' ') {
      println("fire bullet");
      Bullet p = new Bullet(player.x, player.y, BulletType.SMALL);
      bullets.add(p);
    }

    if (keyCode == SHIFT) {
      println("fire big shot");
      Bullet b = new Bullet(player.x, player.y, BulletType.BIG);
      bullets.add(b);
    }
  }
}
