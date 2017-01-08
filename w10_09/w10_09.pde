//Soundライブラリーの読み込み
import processing.sound.*;
//サウンド入力
AudioIn in;
//FFT(高速フーリエ変換)
FFT fft;
//FFTサイズ
int bands = 128;
//グラフの高さのスケールを設定
float scale = 4000.0;

void setup() {
  //3Dで描画
  size(800, 600, P3D);
  noStroke();
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
  blendMode(ADD);
  background(0);
  //FFT解析実行
  fft.analyze();
  //FFTのバンドの数だけくりかえし
  for (int i = 0; i < bands; i++) {
    //色相を計算
    float hue = map(i, 0, bands/4.0, 0, 360);
    //HSBで色を指定
    fill(hue, 100, 100, 30);
    //BoxのサイズをFFT解析結果から算出
    float boxSize = map(fft.spectrum[i], 0, 1, 0, scale);
    //回転角度を設定
    float rot = map(i, 0, bands, 0, PI*8);
    //指定した色とサイズと角度で画面の中心にBoxを描画
    pushMatrix();
    translate(width/2, height/2);
    rotateX(rot+frameCount/frameRate);
    rotateY((rot+frameCount/frameRate)*1.2);
    box(boxSize);
    popMatrix();
  }
}
