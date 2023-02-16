class Rock {
  int x, y, diam, speed, health;
  PImage rock;

  // Constructor
  Rock() {
    x= int(random(width));
    y=-100;
    diam=int(random(50, 100));
    speed=int(random(3, 7));
    rock=loadImage("Rock.png");
    //health = diam;
  }

  void display() {
    imageMode(CENTER);
    rock.resize(diam, diam);
    image(rock, x, y);
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if(y>height+50) {
    return true;
    } else {
    return false;
    }
  }
}
