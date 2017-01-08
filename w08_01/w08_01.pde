void setup() {
  size(600, 600);
  frameRate(60);
  //四角形は中心位置を基準点に
  rectMode(CENTER);
}

void draw() {
  background(0);
  noStroke();
  fill(0, 127, 255);
  //原点を画面の中心に
  translate(width/2.0, height/2.0);
  //回転
  rotate(radians(frameCount));
  //四角形を描く
  rect(0, 0, width/2.0, width/2.0);
}