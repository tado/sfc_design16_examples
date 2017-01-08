PImage img; //画像データ

void setup() {
  size(800, 600);
  //画像を読み込み
  img = loadImage("photo.jpg");
}

void draw() {
  background(0);
  noStroke();
  //モザイクの粒度をマウスのX座標で決定
  int step = mouseX + 1;
  //画面の幅と高さでループ
  for (int j = 0; j < height; j = j + step) {
    for (int i = 0; i < width; i = i + step) {
      //座標を指定して色を取得
      color c = img.get(i, j);
      //取得した色を塗りの色に
      fill(c);
      //四角形を描画
      rect(i, j, step, step);
    }
  }
}