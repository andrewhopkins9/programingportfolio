class PowerUp {
  int x, y, diam, speed;
  char type;
 // PImage rock;

  // Constructor
  PowerUp() {
    x= int(random(width));
    y=-100;
    diam=int(random(50, 60));
    speed=int(random(6, 9));
    int rand = int (random(3));
    if(rand == 0) {
    type = 'H';
    } else if (rand == 1) {
    type = 'A';
    } else {
    type = 'P';
    }
  }

  void display() {
 fill (0,222,0);
 ellipse(x,y,diam,diam);
 fill(0);
 text(type,x,y);
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
  
    boolean intersect(SpaceShip ship) {
    float d = dist(x, y, ship.x, ship.y);
    if (d<50) { // refine collision detection
      return true;
    } else {
      return false;
    }
  }
}
