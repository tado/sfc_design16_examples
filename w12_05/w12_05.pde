// Optical Flowの描画

import gab.opencv.*;
import processing.video.*;

Capture video; // ライブカメラ
OpenCV opencv; // OpenCV

void setup() {
  //初期設定
  size(640, 480); //画面サイズ
  //キャプチャーするカメラのサイズ
  video = new Capture(this, 640/2, 480/2);
  //OpenCVの画面サイズ
  opencv = new OpenCV(this, 640/2, 480/2);
  //キャプチャー開始
  video.start();
}

void draw() {
  //描画スケール設定
  scale(2.0);
  //カメラの画像をOpenCVに読み込み
  opencv.loadImage(video);
  //カメラ画像を表示
  image(video, 0, 0 );
  //OpticalFlowを計算
  opencv.calculateOpticalFlow();
  //描画設定
  stroke(255,0,0);
  //OpticalFlowを描画
  opencv.drawOpticalFlow();
}

//キャプチャーイベント
void captureEvent(Capture c) {
  c.read();
}