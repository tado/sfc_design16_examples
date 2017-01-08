//Soundライブラリーの読み込み
import processing.sound.*;
//サウンドプレイヤー
SoundFile soundfile;

void setup() {
  size(800, 600);
  //サウンドファイルを読み込んでプレイヤーを初期化
  //ファイル名は読み込んだサウンドファイル名に変更
  soundfile = new SoundFile(this, "sound.aiff");
  //ループ再生
  soundfile.loop();
}

void draw() {
  background(0);
  float rate = map(mouseX, 0, width, 0.0, 2.0);
  float amp = map(mouseY, 0, height, 1.0, 0.0);
  soundfile.rate(rate);
  soundfile.amp(amp); 
}