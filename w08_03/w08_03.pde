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
  //X, Y, Z、それぞれの軸で回転
  rotateX(radians(frameCount * 1.0));
  rotateY(radians(frameCount * 1.2));
  rotateZ(radians(frameCount * 1.4));
  rect(0, 0, width/2.0, width/2.0);
}