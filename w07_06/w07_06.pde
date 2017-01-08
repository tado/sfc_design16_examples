PImage img; //画像データ

void setup() {
  size(800, 600);
  //画像を読み込み
  img = loadImage("photo.jpg");
}

void draw() {
  background(0);
  noStroke();
  //画面の幅だけループ
  for (int i = 0; i < width; i++) {
    //現在のマウスのY座標の色を取得
    color c = img.get(i, mouseY);
    //取得した色を塗りの色に
    fill(c);
    //画面の高さいっぱいに幅1pixの長方形を描画
    rect(i, 0, 1, height);
  }
}