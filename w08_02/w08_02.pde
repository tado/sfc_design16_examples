void setup() {
  //レンダラーを3Dに
  size(600, 600, P3D);
  frameRate(60);
  rectMode(CENTER);
}

void draw() {
  background(0);
  noStroke();
  fill(0, 127, 255);
  translate(width/2.0, height/2.0);
  //X軸を回転軸にして回転
  rotateX(radians(frameCount));
  rect(0, 0, width/2.0, width/2.0);
}