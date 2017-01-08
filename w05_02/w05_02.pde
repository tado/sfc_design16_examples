PVector location;
PVector velocity;
void setup() {
    size(800, 600);
    frameRate(60);
    //位置と速度のベクトルを初期化
    location = new PVector(width/2, height/2);
    velocity = new PVector();
    //背景は一度だけ (軌跡を残す)
    background(0);
}

void draw() {
    //速度を設定
    velocity.x = random(-1, 1);
    velocity.y = random(-1, 1);
    location.add(velocity);
    noStroke();
    fill(0, 127, 255);
    ellipse(location.x, location.y, 2, 2);
}