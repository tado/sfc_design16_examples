//OpticalFlow + Particle

import gab.opencv.*;
import processing.video.*;

Capture video; // ライブカメラ
OpenCV opencv; // OpenCV

int NUM = 500;
ParticleVec3[] particles = new ParticleVec3[NUM];

void setup() {
  //初期設定
  size(640, 480, P3D); //画面サイズ
  //キャプチャーするカメラのサイズ
  video = new Capture(this, 640/2, 480/2);
  //OpenCVの画面サイズ
  opencv = new OpenCV(this, 640/2, 480/2);
  //キャプチャー開始
  video.start();

  for (int i = 0; i < NUM; i++) {
    particles[i] = new ParticleVec3();
    particles[i].radius = 4.0;
    particles[i].position.set(random(width/2), random(height/2), 0);
    particles[i].minx = 0;
    particles[i].miny = 0;
    particles[i].maxx = width/2;
    particles[i].maxy = height/2;
  }
}

void draw() {
  background(0);
  blendMode(ADD);
  //描画スケール設定
  scale(2.0);
  //カメラの画像をOpenCVに読み込み
  opencv.loadImage(video);
  //カメラ画像を表示
  //image(video, 0, 0 );
  //OpticalFlowを計算
  opencv.calculateOpticalFlow();
  //描画設定
  stroke(255, 0, 0);
  //OpticalFlowを描画
  opencv.drawOpticalFlow();

  noStroke();
  fill(0, 127, 255);
  for (int i = 0; i < NUM; i++) {
    //パーティクルの位置を更新
    particles[i].update();
    //パーティクルを描画
    particles[i].draw();
    //画面の端で反対側から出現するように
    particles[i].throughOffWalls();
    //OpticalFlowから力を算出してパーティクルに反映する
    if (particles[i].position.x > 0
      && particles[i].position.x < width/2
      && particles[i].position.y > 0
      && particles[i].position.y < height/2 ) {
      PVector vec = opencv.getFlowAt(int(particles[i].position.x), 
        int(particles[i].position.y));
      particles[i].addForce(vec.mult(0.1));
    }
  }
}

//キャプチャーイベント
void captureEvent(Capture c) {
  c.read();
}