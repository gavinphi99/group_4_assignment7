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
    startTime = 0;
  }

  void run() {
    invaderTimer.trigger();
    if (timer.start == 0) {
      start.display();
      if (start.startGame) {
        timer.start = 1;
      }
    } else if (timer.start != 0 && !isDead()) {
      player.update();
      timer.resume();
      bulletDisplay();
      invaderMain();
      displayGUI();
    } else if (timer.start != 0 && isDead()) {
      timer.pause();
      finalScore = round(timer.getStart()/1000) - round(startTimer.getStart()/1000);
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

  PVector vel;
  void invaderTiming() {
    //timing of the invader release
    //local Variables
    if (invaderTimer.isExecuted) {
      float currentTime = millis() - startTime;
      //set velocities
      //only straight down
      if (currentTime < 600000) {
        vel = new PVector(random(-1, 1), 1);

        //insane mode
      } else {
        vel = new PVector(random(-2, 2), random(1, 2));
      }


      invaderSpawn(vel, 25, color(0, 255, 0));
      invaderTimer.reset();

      if (currentTime > 40000) {
        invaderSpawn(vel, 50, color(255, 0, 0));
        invaderTimer.reset();
      }
    }
  }

  void invaderSpawn(PVector vel, int health, color c) {
    PVector pos = new PVector((int)random(width/12, width - width/12), 0);
    rectInvaders.add(new RectInvader(pos, vel, width / 12, height / 16, c, health));
  }

  //everything that should happen when looking at every single 
  void invaderScan() {
    if (rectInvaders.size() > 0) {
      for (int i = 0; i < rectInvaders.size(); i++) {

        //start the timer when the game starts

        if (startTime == 0) {
          startTime = millis();
        }
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
        if (rectInvaders.size() > i && rectInvaders.get(i).isDead()) {
          rectInvaders.remove(i);
        }
        //check if invaders reached the end
        if (rectInvaders.size() > i && rectInvaders.get(i).reachEnd()) {
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
      Bullet p = new Bullet(player.x, player.y, BulletType.SMALL);
      bullets.add(p);
    }

    if (keyCode == CONTROL) {
      Bullet b = new Bullet(player.x, player.y, BulletType.BIG);
      bullets.add(b);
    }
  }
}
