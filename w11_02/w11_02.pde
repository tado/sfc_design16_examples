import oscP5.*;
import netP5.*;

//OSCP5クラスのインスタンス
OscP5 oscP5;
//マウスの位置ベクトル
PVector mouseLoc;
//マウスのクリック検知
int clicked;

void setup() {
  size(800,600);
  frameRate(60);

  //ポートを12000に設定して新規にOSCP5のインスタンスを生成
  oscP5 = new OscP5(this,12000);
  //マウスの位置ベクトルを初期化
  mouseLoc = new PVector(width/2, height/2);
  //マウスのクリック状態を初期化
  clicked = 0;
}

void draw() {
  if(clicked == 1){
    background(255, 0, 0);
  } else {
    background(0);
  }
  //OSCで指定された座標に円を描く
  noFill();
  stroke(255);
  ellipse(mouseLoc.x, mouseLoc.y, 10, 10);
}

//OSCメッセージを受信した際に実行するイベント
void oscEvent(OscMessage msg) {
  //もしOSCメッセージが /mouse/position だったら
  if(msg.checkAddrPattern("/mouse/position")==true) {
    //最初の値をint方としてX座標に
    mouseLoc.x = msg.get(0).intValue();
    //次の値をint方としてY座標に
    mouseLoc.y = msg.get(1).intValue();
  }
  if(msg.checkAddrPattern("/mouse/cliked")==true) {
    //Bool値を読み込み
    clicked = msg.get(0).intValue(); 
    println("msg = " + clicked);
    print("*");
  }
}