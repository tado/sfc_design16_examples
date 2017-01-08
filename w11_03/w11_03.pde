import oscP5.*;
import netP5.*;

//OSCP5クラスのインスタンス
OscP5 oscP5;
//マウスの位置ベクトル
PVector mouseLoc;
//Ringクラスのリスト
ArrayList<Ring> ringList = new ArrayList<Ring>();

void setup() {
  size(800, 600);
  frameRate(60);

  //ポートを12000に設定して新規にOSCP5のインスタンスを生成
  oscP5 = new OscP5(this,12000);
  //マウスの位置ベクトルを初期化
  mouseLoc = new PVector(width/2, height/2);
}

void draw() {
  background(0);
  noFill();
  stroke(255);
  strokeWeight(1);
  ellipse(mouseLoc.x, mouseLoc.y, 10, 10);
  //リストに格納されたマウスの位置を全て描画する
  strokeWeight(2);
  for (int i = 0; i < ringList.size(); i++) {
    ringList.get(i).draw();
  }
}

//OSCメッセージを受信した際に実行するイベント
void oscEvent(OscMessage msg) {
  //もしOSCメッセージが /mouse/position だったら
  if (msg.checkAddrPattern("/mouse/position")==true) {
    //最初の値をint方としてX座標に
    mouseLoc.x = msg.get(0).intValue();
    //次の値をint方としてY座標に
    mouseLoc.y = msg.get(1).intValue();
  }
  if (msg.checkAddrPattern("/mouse/cliked")==true) {
    //もしマウスがクリックされたメッセージを受けとったら
    if (msg.get(0).intValue() == 1) {
      //マウスの位置のリストに新規に現在の位置を追加する
      ringList.add(new Ring(mouseLoc.x, mouseLoc.y));
    }
  }
}

class Ring {
  PVector location;
  float radius;
  float speed;
  float alpha;
  float alphaSpeed;
  float release;
  
  Ring(float _x, float _y) {
    location = new PVector(_x, _y);
    radius = 20;
    speed = 1.0;
    alpha = 255;
    alphaSpeed = 1.0;
    release = 5.0;
  }

  void draw() {
    alphaSpeed = 255.0/(release*frameRate);
    fill(63, 127, 255, alpha);
    noStroke();
    pushMatrix();
    translate(location.x, location.y);
    ellipse(0, 0, radius, radius);
    popMatrix();
    radius += speed;
    alpha -= alphaSpeed;
    strokeWeight(1.0);
  }
}