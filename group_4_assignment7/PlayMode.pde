class PlayMode {
  StartScreen start;
  Player player;
  EndScreen end;
  Timer timer, startTimer, invaderTimer;
  int timeInterval;
  int lives;
  ArrayList<Bullet> bullets;
  float finalScore;
  float startTime;

  ArrayList<RectInvader> rectInvaders;

  PlayMode(ArrayList<Score> scoreList) {
    lives = 3; // change to positive integer for play testing
    //println(scoreList);
    start = new StartScreen(scoreList);
    player = new Player();
    end = new EndScreen(scoreList);
    timer = new Timer(Integer.MAX_VALUE, false);
    timeInterval = 5000;
    invaderTimer = new Timer(timeInterval, false);

    bullets = new ArrayList<Bullet>();
    rectInvaders = new ArrayList<RectInvader>();
    startTimer = new Timer(Integer.MAX_VALUE, false);
    startTimer.resume();
    finalScore = 0;
  }

  void run() {
    invaderTimer.trigger();
    if (timer.start == 0) {
      start.display();
      if (start.startGame) {
        timer.start = 1;
      }
    } else if (timer.start != 0 && !isDead()) {
      startTimer.pause();
      player.update();
      
      timer.resume();
      bulletDisplay();
      invaderMain();
      displayGUI();
      
    } else if (timer.start != 0 && isDead()) {
      timer.pause();
      finalScore = round(timer.getStart()/1000);
      scoreList.get(0).score = finalScore;
      end.update();
      
    }
  }

  //TODO: sub lives when enemies at bottom of screen
  boolean isDead() {
    if (lives == 0) {
      return true;
    }
    return false;
  }
  
  void displayGUI() {
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(20);
    text("SCORE: " + str(round(timer.getStart()/1000) - round(startTimer.getStart()/1000)), width - 100, 25);
    text("LIVES: " + str(lives), 75, 25);
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
    if (currentTime < 40000 && invaderTimer.isExecuted) {
      pos = new PVector((int)random(width), 0);
      vel = new PVector(0, 1);
      rectInvaders.add(new RectInvader(pos, vel, width / 12, height / 16, color(0, 255, 0), 20));

      invaderTimer.reset();
    } else if (currentTime < 80000 && invaderTimer.isExecuted) {
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
          rectInvaders.get(i).update();

          //register if they got hit
          if (bullets.size() > 0) {
            for (int j = 0; j < bullets.size(); j++) {
              //if the projectile hits the block
              if (rectInvaders.get(i).wasHit(bullets.get(j))) {
                rectInvaders.get(i).health -= bullets.get(j).damage;
                bullets.remove(j);
              }
            }
          }
        }
        //check if invaders are dead
        if (rectInvaders.size() > 0 && rectInvaders.get(i).isDead()) {
          rectInvaders.remove(i);
        }
        //check if invaders reached the end
        if (rectInvaders.size() > 0 && rectInvaders.get(i).reachEnd()) {
          rectInvaders.remove(i);
          lives -= 1;
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
      //println("fire bullet");
      Bullet p = new Bullet(player.x, player.y, BulletType.SMALL);
      bullets.add(p);
    }

    if (keyCode == SHIFT) {
      //println("fire big shot");
      Bullet b = new Bullet(player.x, player.y, BulletType.BIG);
      bullets.add(b);
    }
  }
}
