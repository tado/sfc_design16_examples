int NUM = 1000;
PVector[] start = new PVector[NUM];
PVector[] end = new PVector[NUM];

void setup() {
  //レンダラーを3Dに
  size(600, 600, P3D);
  frameRate(60);
  //開始位置と終了位置を3Dのランダムな座標に
  for (int i=0; i<NUM; i++) {
    start[i] = new PVector(random(-height/2, height/2), random(-height/2, height/2), random(-height/2, height/2));
    end[i] = new PVector(random(-height/2, height/2), random(-height/2, height/2), random(-height/2, height/2));
  }
}

void draw() {
  background(0);
  noFill();
  stroke(31, 127, 255, 180);
  translate(width/2, height/2);
  //画面全体を回転させるアニメーション
  rotateX(frameCount / 1000.0);
  rotateY(frameCount / 800.0);
  rotateZ(frameCount / 2000.0);
  //生成した座標を結ぶ線を描画
  for (int i=0; i<NUM; i++) {
    line(start[i].x, start[i].y, start[i].z, end[i].x, end[i].y, end[i].z);
  }
}