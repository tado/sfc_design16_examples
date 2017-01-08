PImage img; //画像データ
//モザイクの幅と高さ
int mosaicWidth = 40;
int mosaicHeight = 30;

void setup() {
  size(800, 600);
  //画像を読み込み
  img = loadImage("photo.jpg");
}

void draw() {
  for (int j = 0; j < height; j+=mosaicHeight) {
    for (int i = 0; i < width; i+=mosaicWidth) {
      //指定した位置の色を取得
      color col = img.get(i, j);
      //取得した色を画像の色に
      tint(red(col), green(col), blue(col));
      //画像を描画
      image(img, i, j, mosaicWidth, mosaicHeight);
    }
  }
}