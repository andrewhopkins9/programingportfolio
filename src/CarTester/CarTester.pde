// Andrew Hopkins | Oct 25 2022 | CarTester
Car c1;
Car c2;
Car[] cars = new Car[10];

void setup() {
  size(200, 200);
  c1 = new Car();
  c2 = new Car();
  for (int i=0; i<cars.length; i++) {
    cars[i] = new Car();
  }
}
void draw() {
  background(128);
  c1.display();
  c1.drive();
  c2.display();
  c2.drive();
  for (int i=0; i<cars.length; i++) {
    cars[i].display();
    cars[i].drive();
  }
}
