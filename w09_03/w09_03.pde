//controlP5ライブラリーの読み込み
import controlP5.*;
//ControlP5をcp5として宣言
ControlP5 cp5;

Slider boxSize; //スライダー : 立方体のサイズ
Slider2D rotate; //スライダー2D : 回転スピード(x, y)

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
  .setSize(100,100)
  .setMinMax(1.0,1.0,10.0,10.0)
  .setValue(2.0,2.0);
}

void draw() {
  background(0);
  pushMatrix();
  //ライティングをONに
  lights();
  //画面の中心を原点に
  translate(width/2, height/2, 0);
  //X軸を中心に回転
  rotateX(millis()/1000.0 * rotate.getArrayValue()[0]);
  //Y軸を中心に回転
  rotateY(millis()/1000.0 * rotate.getArrayValue()[1]);
  //白い立方体を描画
  fill(255);
  noStroke();
  box(boxSize.getValue());
  popMatrix();
}