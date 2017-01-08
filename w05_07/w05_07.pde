int NUM = 2000;
Walker[] walker = new Walker[NUM];

void setup() {
  size(800, 600, P3D);
  frameRate(60);
  noCursor();

  for (int i = 0; i < NUM; i++) {
    walker[i] = new Walker();
  }

  background(0);
}

void draw() {
  blendMode(BLEND);
  fill(0, 15);
  rect(0, 0, width, height);
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
    for (int i = 0; i < 4; i++) {
      velocity.x = random(-1, 1);
      velocity.y = random(-1, 1);
      location.add(velocity);
      noStroke();
      blendMode(ADD);
      fill(15, 63, 255);
      ellipse(location.x, location.y, 2, 2);
    }
  }
}