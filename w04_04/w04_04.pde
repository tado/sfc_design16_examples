PVector location; //円の中心位置を格納する変数
PVector velocity; //円の速度を格納する変数
void setup() {
  size(800, 600); //800x600 pixelの画面を生成
  frameRate(60); //フレームレート
  location = new PVector(random(width), random(height));
  velocity = new PVector(random(-10, 10), random(-10, 10));
}

void draw() {
  background(0); //背景を描画
  location.add(velocity); //位置のベクトルに速度のベクトルを加算、次の位置になる

  noStroke(); //枠線なし
  fill(0, 127, 255); //塗りの色
  ellipse(location.x, location.y, 20, 20); //指定した位置に円を描画
  if (location.x < 0 || location.x > width) { //もし画面の左端、または右端に到達したら
    velocity.x = velocity.x * -1; //X方向のスピードを反転
  }
  if (location.y < 0 || location.y > height) { //もし画面の下端、または上端に到達したら
    velocity.y = velocity.y * -1; //Y方向のスピードを反転
  }
}