ParticleVec2 particle;

void setup() {
  //初期設定
  size(800, 600);
  frameRate(60);
  noStroke();
  fill(255);
  //パーティクルをインスタンス化
  particle = new ParticleVec2();
  particle.location.set(10, height/2); //初期位置を設定
  particle.gravity.set(0, 1);          //重力を設定
  particle.friction = 0.01;            //摩擦力を設定
  particle.mass = 1.0;                 //質量を設定
  //力を加える
  particle.addForce(new PVector(20, -20));
}

void draw() {
  background(0);
  particle.update();  //パーティクルの位置を更新
  particle.draw();    //パーティクルを描画
}

//パーティクルクラス
class ParticleVec2 {
  PVector location;       //位置
  PVector velocity;       //速度
  PVector acceleration;   //加速度
  PVector gravity;        //重力
  float radius;           //パーティクルの半径
  float friction;         //摩擦
  float mass;             //質量

  //コンストラクター
  ParticleVec2() {
    //初期パラメーターを設定
    radius = 4.0;
    location = new PVector(width/2.0, height/2.0);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    gravity = new PVector(0, 0);
    friction = 0.0;
    mass = 1.0;
  }

  //座標の更新
  void update() {
    velocity.add(acceleration);     //速度に加速度を加算
    velocity.add(gravity);          //重力を加える
    velocity.mult(1.0 - friction);  //摩擦力を加味した速度を計算
    location.add(velocity);         //速度から位置を算出
    acceleration.set(0, 0);         //加速度をリセット
  }

  //力を加える関数
  void addForce(PVector force) {
    //質量から加速度を計算 (a = f/m);
    force.div(mass);
    acceleration.add(force);
  }

  //パーティクルを描画
  void draw() {
    ellipse(location.x, location.y, radius * 2, radius * 2);
  }
}