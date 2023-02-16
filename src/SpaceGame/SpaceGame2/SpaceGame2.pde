// Andrew Hopkins | Nov 29 2022 | SpaceGame
SpaceShip s1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
Star[] stars = new Star[100];
Timer rockTimer, puTimer;
int score, level;
boolean play;


void setup() {
  size(800, 800);
  s1 = new SpaceShip();
  rockTimer = new Timer(1500);
  rockTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
  for (int i=0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  rockTimer = new Timer (1000);
  score = 0;
  level = 1;
  play = false;
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(20);

    // Adding PowerUps
    if (puTimer.isFinished()) {
      powerups.add(new PowerUp());
      puTimer.start();
    }

    // Render PowerUps
    for (int i = 0; i < powerups.size(); i++) {
      PowerUp pu = powerups.get(i);
      if (pu.intersect(s1)) {
        if (pu.type == 'H') {
          s1.health += 100;
        } else if(pu.type == 'A') {
        s1.ammo += 100;
        } else if(pu.type == 'P') {
        score += 1000;
        }
        powerups.remove(pu);
      }
      if (pu.reachedBottom()) {
        powerups.remove(pu);
      } else {
        pu.display();
        pu.move();
      }
    }

    // Adding Rocks
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start();
    }


    // Render Rocks
    for (int i = 0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      if (s1.intersect(r)) {
        s1.health-=10;
        score-=r.diam;
        // todo: add health to rocks
        // todo: make explosion sound
        //todo: make and explosion animation
        rocks.remove(r);
      }
      if (r.reachedBottom()) {
        rocks.remove(r);
      } else {
        r.display();
        r.move();
        println(rocks.size());
      }
    }
    // Render Lasers
    for (int i = lasers.size()-1; i >= 0; i--) {
      Laser l = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (l.intersect(r)) {
          score+=100;
          //Level increase
          if (score%1000 == 0) {
            level+=1;
            s1.ammo +=100;
          }
          rocks.remove(r);
          //r.health-=50;
          lasers.remove(l);
          //todo call the explosion animation
          // add a sound of explosion
        }
      }
      if (l.reachedTop()) {
        lasers.remove(l);
      } else {
        l.display();
        l.move();
      }
    }

    noCursor();
    for (int i=0; i<stars.length; i++) {
      stars[i].display();
      stars[i].move();
    }
    s1.display();
    s1.move(mouseX, mouseY);
    infoPanel();

    if (s1.health < 1) {
      gameOver();
    }
  }
}

void mousePressed() {
  if (s1.fire() && s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y));
    println(lasers.size());
  } else {
    if (s1.fire() && s1.turretCount == 2) {
      lasers.add(new Laser(s1.x-21, s1.y));
      lasers.add(new Laser(s1.x+24, s1.y));
      println(lasers.size());
    }
  }
}
void keyPressed() {
}

void infoPanel() {
  fill(100, 100);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(255);
  textSize(35);
  textAlign(CENTER);
  text("Score: " + score +
    " | Health: " + s1.health +
    " | Level: " + level +
    " | Ammo: " + s1.ammo, width/2, 40);
}

void startScreen() {
  background(0);
  fill(150);
  textSize(25);
  textAlign(CENTER);
  text("Ready to start your journey? \n Press any key to begin \n Instructions: \n Click to shoot the astroids, \n collect the highest score, \n Don't get hit!", width/2, height/2-75);
  if (keyPressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(150);
  textSize(25);
  textAlign(CENTER);
  text("Game Over.", width/2, height/2);
  play = false;
  noLoop();
}
