//OpenCVによる顔検出
import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video; //ビデオキャプチャー
OpenCV opencv; //OpenCV

void setup() {
  size(640, 480);
  //ビデオキャプチャー初期化
  video = new Capture(this, 640/2, 480/2);
  //OpenCV初期化(ビデオキャプチャーの半分のサイズ)
  opencv = new OpenCV(this, 640/2, 480/2);
  //顔の学習データを読み込み
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  //ビデオキャプチャー開始
  video.start();
}

void draw() {
  //二倍サイズで表示
  scale(2);
  //画像を読み込み
  opencv.loadImage(video);
  //カメラ画像を描画
  image(video, 0, 0 );

  //顔を検出
  Rectangle[] faces = opencv.detect();
  //検出した顔の周囲を四角形で描画
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  for (int i = 0; i < faces.length; i++) {
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
}

//キャプチャーイベント
void captureEvent(Capture c) {
  c.read();
}
