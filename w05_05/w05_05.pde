int NUM = 10;
Walker[] walker = new Walker[NUM];

void setup() {
  size(800, 600);
  frameRate(60);

  for (int i = 0; i < NUM; i++) {
    walker[i] = new Walker();
  }

  background(0);
}

void draw() {
  for (int i = 0; i < NUM; i++) {
    walker[i].draw();
  }
}

class Walker {
  PVector location;
  PVector velocity;

  Walker() {
    location = new PVector(width/2, height/2);
    velocity = new PVector();
  }

  void draw() {
    for (int i = 0; i < 10; i++) {
      velocity.x = random(-1, 1);
      velocity.y = random(-1, 1);
      location.add(velocity);
      noStroke();
      fill(0, 127, 255, 15);
      ellipse(location.x, location.y, 2, 2);
    }
  }
}