//Soundライブラリーの読み込み
import processing.sound.*;
//サウンド入力
AudioIn in;
//FFT(高速フーリエ変換)
FFT fft;
//FFTサイズ(2の累乗)
int bands = 128;
//グラフの高さのスケールを設定
float scale = 5000.0;

void setup() {
  size(800, 600);
  noStroke();
  //サウンド入力を初期化
  in = new AudioIn(this, 0);
  //入力したサウンドを再生
  in.start();
  //FFTの初期化
  fft = new FFT(this, bands);
  //FFTの入力信号の指定  
  fft.input(in);
}

void draw() {
  background(0);
  //FFT解析実行
  fft.analyze();
  //グラフの横幅を算出
  float w = width/float(bands)/2.0;
  //FFTのバンドの数だけくりかえし
  for (int i = 0; i < bands; i++) {
    //FFTの解析結果を色の明るさに変換
    fill(fft.spectrum[i] * scale);
    //左右に四角形を描く
    rect(width/2.0 + i * w, 0, w, height);
    rect(width/2.0 - i * w, 0, w, height);
  }
}