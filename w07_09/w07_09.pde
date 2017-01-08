PImage img; //画像データ
//モザイクの幅と高さ
int mosaicWidth = 40;
int mosaicHeight = 30;

void setup() {
  size(800, 600);
  //画像を読み込み
  img = loadImage("photo.jpg");
  background(0); //背景
  noStroke(); //枠線は無し
}

void draw() {
  //一度の10個の円を生成
  for(int i = 0; i < 10; i++){
    //色を取得する位置をランダムに決定
    int x = int(random(width));
    int y = int(random(height));
    //指定した場所の色を取得
    color col = img.get(x, y);
    fill(col, 127);
    //色の再度を円の直径にする
    float ellipseSize = saturation(col) / 8.0;
    //円を描画
    ellipse(x, y, ellipseSize, ellipseSize);
  }
}