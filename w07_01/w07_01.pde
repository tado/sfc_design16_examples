PImage img; //画像データ

void setup() {
  size(800, 600);
  //画像を読み込み
  img = loadImage("photo.jpg");
}

void draw() {
  //画面に画像データを表示
  image(img, 0, 0);
}