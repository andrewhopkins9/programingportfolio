class Laser {
  int x, y, w, h, speed;
  color c1;

  // Constructor
  Laser(int x, int y) {
    this.x= x;
    this.y= y;
    w=3;
    h=10;
    speed=10;
    c1 = color (0, 0, 255);
  }

  void display() {
    fill(c1);
    rectMode(CENTER);
    noStroke();
    rect(x, y, w, h);
  }

  void move() {
    y -= speed;
  }

  boolean reachedTop() {
    if (y<-10) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d<22) { // refine collision detection
      return true;
    } else {
      return false;
    }
  }
}
