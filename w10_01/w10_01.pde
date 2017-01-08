//Soundライブラリーの読み込み
import processing.sound.*;
//サウンドプレイヤー
SoundFile soundfile;

void setup() {
  //サウンドファイルを読み込んでプレイヤーを初期化
  //ファイル名は読み込んだサウンドファイル名に変更
  soundfile = new SoundFile(this, "sound.aiff");
  //ループ再生
  soundfile.loop();
}

void draw(){
}