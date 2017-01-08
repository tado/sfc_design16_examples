PVector location;
PVector velocity;
void setup() {
    size(800, 600);
    frameRate(60);
    location = new PVector(width/2, height/2);
}

void draw() {
    background(0);
    velocity = new PVector(random(-10, 10), random(-10, 10));
    location.add(velocity);
    
    noStroke();
    fill(0, 127, 255);
    ellipse(location.x, location.y, 20, 20);
}