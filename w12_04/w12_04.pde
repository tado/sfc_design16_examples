//OpenCVによる顔検出
//目線を入れてみる
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
  fill(0);
  for (int i = 0; i < faces.length; i++) {
    //ちょうど目の場所にくるよう、場所とサイズを調整
    float x = faces[i].x + faces[i].width * 0.15;
    float y = faces[i].y + faces[i].height * 0.3;
    float width = faces[i].width * 0.7;
    float height = faces[i].height * 0.15;
    //目線を描画
    rect(x, y, width, height);
  }
}

//キャプチャーイベント
void captureEvent(Capture c) {
  c.read();
}
