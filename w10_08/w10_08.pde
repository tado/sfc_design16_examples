//Soundライブラリーの読み込み
import processing.sound.*;
//サウンド入力
AudioIn in;
//FFT(高速フーリエ変換)
FFT fft;
//FFTサイズ
int bands = 128;
//グラフの高さのスケールを設定
float scale = 40000.0;

void setup() {
  size(800, 600, P2D);
  noStroke();
  blendMode(ADD);
  //HSB(色相、彩度、明度)モードで色を表現
  colorMode(HSB, 360, 100, 100, 100);
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
  float w = width/float(bands)/2.0;
  //FFTのバンドの数だけくりかえし
  for (int i = 0; i < bands; i++) {
    //色相を計算
    float hue = 360/float(bands) * i;
    //HSBで色を指定
    fill(hue, 100, 6);
    //円の直径をFFT解析結果から算出
    float diameter = fft.spectrum[i] * scale;
    //左右に円を描く
    ellipse(width/2.0 + i * w, height/2.0, diameter, diameter);
    ellipse(width/2.0 - i * w, height/2.0, diameter, diameter);
  }
}