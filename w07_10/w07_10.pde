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
  //一度に100個生成
  for (int i=0; i<100; i++) {
    //場所をランダムに決定
    int x = int(random(width));
    int y = int(random(height));
    //色を取得
    color col = img.get(x, y);
    //色を指定
    fill(col, 127);
    pushMatrix();
    translate(x, y);
    //色の色相を回転角度に
    rotate(radians(hue(col)/255.0 * 360.0));
    rectMode(CENTER);
    //色の再度を四角形の幅に
    rect(0, 0, saturation(col)/8.0, 1.5);
    popMatrix();
  }
}