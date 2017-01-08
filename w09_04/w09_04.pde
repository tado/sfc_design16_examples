//controlP5ライブラリーの読み込み
import controlP5.*;
//ControlP5をcp5として宣言
ControlP5 cp5;

Slider boxSize; //スライダー : 立方体のサイズ
Slider2D rotate; //スライダー2D : 回転スピード(x, y)
ColorWheel col; //カラー : 立方体の色
Toggle start; //トグルボタン : スタート/ストップ

void setup() {
  //画面を設定
  size(800, 600, P3D);
  //controlP5を初期化
  cp5 = new ControlP5(this);
  //スライダーを追加
  //スライダー1 : ボックスのサイズ
  boxSize = cp5.addSlider("BOX SIZE")
    .setPosition(20, 20)
    .setRange(0, 400)
    .setValue(200);
  //スライダー2D : 回転スピードXY
  rotate = cp5.addSlider2D("ROTATION")
    .setPosition(20, 40)
    .setSize(100, 100)
    .setMinMax(1.0, 1.0, 10.0, 10.0)
    .setValue(2.0, 2.0);
  // トグルスイッチ
  start = cp5.addToggle("START/STOP")
    .setPosition(20, 160)
    .setSize(20, 20);
  //カラーの選択
  col = cp5.addColorWheel("COLOR")
    .setPosition(20, 220)
    .setRGB(color(31, 128, 255));
}

void draw() {
  background(0);
  pushMatrix();
  //ライティングをONに
  lights();
  //画面の中心を原点に
  translate(width/2, height/2, 0);
  //もしトグルスイッチがONになっていたら、回転
  if (start.getState()) {
    //X軸を中心に回転
    rotateX(millis()/1000.0 * rotate.getArrayValue()[0]);
    //Y軸を中心に回転
    rotateY(millis()/1000.0 * rotate.getArrayValue()[0]);
  }
  //カラーパレットで選択した色で塗る
  fill(col.getRGB());
  noStroke();
  //立方体の描画
  box(boxSize.getValue());
  popMatrix();
}