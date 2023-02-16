class Star {
  int x, y, diam, speed;
  PImage star;


  // Constructor
  Star() {
    x= int(random(width));
    y=int(random(height));
    diam=int(random(40, 80));
    speed = int(random(3,7));
    star=loadImage("Star2.png");
  }

  void display() {
    imageMode(CENTER);
    star.resize(diam, diam);
    image(star, x, y);
  }

  void move() {
    if (y>height+5) {
      y=-10;
    } else {
      y += speed;
    }
  }

  boolean reachedBottom() {
 return true;
  }
}
