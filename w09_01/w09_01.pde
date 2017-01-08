void setup() {
  //画面を設定
  size(800, 600, P3D);
}

void draw() {
  background(0);
  //ライティングをONに
  lights();
  //画面の中心を原点に
  translate(width/2, height/2, 0);
  //X軸を中心に回転
  rotateX(millis()/1000.0 * 1.0);
  //Y軸を中心に回転
  rotateY(millis()/1000.0 * 1.5);
  //白い立方体を描画
  fill(255);
  noStroke();
  box(200);
}