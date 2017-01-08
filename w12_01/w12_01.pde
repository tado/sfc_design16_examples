// カメラキャプチャー基本
import gab.opencv.*;
import processing.video.*;

Capture video; // ライブカメラ

void setup() {
  //初期設定
  size(640, 480); //画面サイズ
  //キャプチャーするカメラのサイズ
  video = new Capture(this, 640, 480);
  //キャプチャー開始
  video.start();
}

void draw() {
  //カメラ画像を表示
  image(video, 0, 0 );
}

//キャプチャーイベント
void captureEvent(Capture c) {
  c.read();
}
