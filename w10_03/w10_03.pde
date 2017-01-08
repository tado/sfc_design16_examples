//Soundライブラリーの読み込み
import processing.sound.*;
//サウンドプレイヤー
SoundFile soundfile;
Delay delay;

void setup() {
  size(800, 600);
  //サウンドファイルを読み込んでプレイヤーを初期化
  //ファイル名は読み込んだサウンドファイル名に変更
  soundfile = new SoundFile(this, "sound.aiff");
  delay = new Delay(this);
  //ループ再生
  soundfile.loop();
  // Patch the delay
  delay.process(soundfile, 5);
}

void draw() {
  background(0);
  float delayTime = map(mouseY, 0, height, 0.0001, 1.0);
  delay.time(delayTime);
  float feedback = map(mouseX, 0, width, 0.0, 0.9);
  delay.feedback(feedback);
}