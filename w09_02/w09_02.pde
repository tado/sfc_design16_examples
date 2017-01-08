//controlP5ライブラリーの読み込み
import controlP5.*;
//ControlP5をcp5として宣言
ControlP5 cp5;

//スライダーを3つ宣言
Slider boxSize; //立方体のサイズ
Slider rotateX; //回転スピードX
Slider rotateY; //回転スピードY

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
  //スライダー2 : 回転スピードX
  rotateX = cp5.addSlider("ROTATE X")
    .setPosition(20, 30)
    .setRange(1.0, 10.0)
    .setValue(2.0);
  //スライダー3 : 回転スピードY
  rotateY = cp5.addSlider("ROTATE Y")
    .setPosition(20, 40)
    .setRange(1.0, 10.0)
    .setValue(2.0);
}

void draw() {
  background(0);
  pushMatrix();
  //ライティングをONに
  lights();
  //画面の中心を原点に
  translate(width/2, height/2, 0);
  //X軸を中心に回転
  rotateX(millis()/1000.0 * rotateX.getValue());
  //Y軸を中心に回転
  rotateY(millis()/1000.0 * rotateY.getValue());
  //白い立方体を描画
  fill(255);
  noStroke();
  box(boxSize.getValue());
  popMatrix();
}