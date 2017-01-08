// OpenCV輪郭抽出
import gab.opencv.*;
import processing.video.*;

Capture video; // ライブカメラ
OpenCV opencv; // OpenCV
ArrayList<Contour> contours; //輪郭の配列

void setup() {
  //初期設定
  size(640, 480); //画面サイズ
  //キャプチャーするカメラのサイズ
  video = new Capture(this, 640, 480);
  //OpenCVの画面サイズ
  opencv = new OpenCV(this, 640, 480);
  //キャプチャー開始
  video.start();
}

void draw() {
  //カメラの画像をOpenCVに読み込み
  opencv.loadImage(video);
  //カメラ画像を表示
  image(video, 0, 0 );
  //閾値の設定(マウスのX座標で変化)
  int threshold = int(map(mouseX, 0, width, 0, 100));
  opencv.threshold(threshold);
  //輪郭抽出
  contours = opencv.findContours();
  //描画設定
  noFill();
  strokeWeight(1);
  //検出された輪郭の数だけ、輪郭線を描く
  for (Contour contour : contours) {
    stroke(0, 255, 0);
    contour.draw();
  }
}

//キャプチャーイベント
void captureEvent(Capture c) {
  c.read();
}
