//Soundライブラリーの読み込み
import processing.sound.*;
//サウンド入力
AudioIn in;
//FFT(高速フーリエ変換)
FFT fft;
//FFTサイズ
int bands = 1024;
//グラフの高さのスケールを設定
float scale = 20.0;

void setup() {
  size(800, 600);
  //サウンド入力を初期化
  in = new AudioIn(this, 0);
  //入力したサウンドを再生
  in.start();
  //FFTの初期化
  fft = new FFT(this, bands);
  fft.input(in);
}

void draw() {
  background(0);
  //FFT解析実行
  fft.analyze();
  //グラフの横幅を算出
  //float w = width/float(bands);
  noFill();
  stroke(255);
  //線分の描画開始
  beginShape();
  //FFTのバンドの数だけくりかえし
  for (int i = 0; i < bands; i++) {
    //FFTの解析結果を高さにグラフを描く
    vertex(i * width/float(bands), height - fft.spectrum[i] * height * scale);
  }
  //線分の描画終了
  endShape();
}