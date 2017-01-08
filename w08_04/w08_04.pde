//線の数
int NUM = 1000;
//線の開始位置の配列
PVector[] start = new PVector[NUM];
//線の終了位置の配列
PVector[] end = new PVector[NUM];

void setup() {
  size(600, 600, P2D);
  frameRate(60);
  //開始位置と終了位置の座標をランダムな位置に
  for (int i=0; i<NUM; i++) {
    start[i] = new PVector(random(-height/2, height/2), random(-height/2, height/2));
    end[i] = new PVector(random(-height/2, height/2), random(-height/2, height/2));
  }
}

void draw() {
  background(0);
  noFill();
  stroke(31, 127, 255, 127);
  //画面の中心を原点に
  translate(width/2, height/2);
  //生成した座標で線を描画
  for (int i=0; i<NUM; i++) {
    line(start[i].x, start[i].y, end[i].x, end[i].y);
  }
}