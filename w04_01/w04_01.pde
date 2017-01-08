//初期化関数
void setup() {
  size(800, 600);
  frameRate(12);   //書き換え頻度の設定
  background(0);
}

//メインループ
void draw() {
  float diameter = random(100);
  noStroke();
  fill(random(255), random(255), random(255));
  ellipse(random(width), random(height), diameter, diameter);
}