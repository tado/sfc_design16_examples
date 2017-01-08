PVector location;
PVector velocity;
void setup() {
    size(800, 600);
    frameRate(60);
    location = new PVector(width/2, height/2);
    velocity = new PVector();
    background(0);
}

void draw() {
    //10回ずつくりかえし
    for (int i = 0; i < 10; i++) {
        velocity.x = random(-1, 1);
        velocity.y = random(-1, 1);
        location.add(velocity);
        noStroke();
        fill(0, 127, 255, 31); //透明度を追加
        ellipse(location.x, location.y, 2, 2);
    }
}