PImage img; //画像データ

void setup() {
  size(800, 600);
  //画像を読み込み
  img = loadImage("photo.jpg");
}

void draw() {
  background(0); //背景
  //位置と大きさを指定して、画像データを表示
  image(img, width/4, height/4, width/2, height/2);
}