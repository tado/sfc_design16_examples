int NUM = 100; //配列の数
//位置のベクトルの配列
PVector[] location = new PVector[NUM];
//速度のベクトルの配列
PVector[] velocity = new PVector[NUM];

void setup() {
  size(800, 600); //800x600pixelの画面を生成
  frameRate(60); //フレームレート
  noStroke(); //枠線なし
  fill(0, 127, 255); //塗りの色
  for (int i = 0; i < NUM; i++) { //配列の数だけ繰り返し
    //位置のベクトルの初期設定
    location[i] = new PVector(random(width), random(height));
    //速度のベクトルの初期設定
    velocity[i] = new PVector(random(-4, 4), random(-4, 4));
  }
}

void draw() {
  background(15); //背景を描画
  for (int i = 0; i < NUM; i++) { //配列の数だけ繰り返し
    //指定した位置に円を描画
    ellipse(location[i].x, location[i].y, 20, 20);
    //位置のベクトルに速度のベクトルを加算、次の位置になる
    location[i].add(velocity[i]);
    //もし画面の左端、または右端に到達したら
    if ((location[i].x > width) || (location[i].x < 0)) {
      velocity[i].x *= -1; //X方向のスピードを反転
    }
    //もし画面の下端、または上端に到達したら
    if ((location[i].y > height) || (location[i].y < 0)) {
      velocity[i].y *= -1; //Y方向のスピードを反転
    }
  }
}