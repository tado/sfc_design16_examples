ParticleVec2 particle;

void setup() {
  //初期設定
  size(800, 600);
  frameRate(60);
  noStroke();
  fill(255);
  //パーティクルをインスタンス化
  particle = new ParticleVec2();
  //初期位置を設定
  particle.location.set(10, 10);
  //速度を設定
  particle.velocity.set(3, 2);
}

void draw() {
  background(0);
  //パーティクルの位置を更新
  particle.update();
  //パーティクルを描画
  particle.draw();
}

//パーティクルクラス
class ParticleVec2 {
  PVector location;       //位置
  PVector velocity;       //速度
  float radius;           //パーティクルの半径

  //コンストラクター
  ParticleVec2() {
    //初期パラメーターを設定
    radius = 4.0;
    location = new PVector(width/2.0, height/2.0);
    velocity = new PVector(0, 0);
  }

  //座標の更新
  void update() {
    location.add(velocity);     //速度から位置を算出
  }

  //パーティクルを描画
  void draw() {
    ellipse(location.x, location.y, radius * 2, radius * 2);
  }
}