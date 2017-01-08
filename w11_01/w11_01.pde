//OSC関連のライブラリーをインポート
import oscP5.*;
import netP5.*;

//OSCP5クラスのインスタンス
OscP5 oscP5;
//OSC送出先のネットアドレス
NetAddress myRemoteLocation;

void setup() {
  size(800,600);
  frameRate(60);
  //ポートを12001に設定して新規にOSCP5のインスタンスを生成
  oscP5 = new OscP5(this,12001);
  //OSC送信先のIPアドレスとポートを指定
  myRemoteLocation = new NetAddress("127.0.0.1",12000);
}

void draw() {
  //マウスボタンをクリックすると背景を赤に
  if(mousePressed){
    background(255, 0, 0);
  } else {
    background(0);
  }

  //マウスの場所に円を描く
  noFill();
  stroke(255);
  ellipse(mouseX, mouseY, 10, 10);

  //現在のマウスの位置をOSCで送出
  //新規にメッセージ作成
  OscMessage msg = new OscMessage("/mouse/position");
  msg.add(mouseX); //X座標の位置を追加
  msg.add(mouseY); //Y座標の位置を追加
  //OSCメッセージ送信
  oscP5.send(msg, myRemoteLocation);
}

//マウスボタンを押した時にメッセージを送信
void mousePressed(){
  OscMessage msg = new OscMessage("/mouse/cliked");
  msg.add(1); //1を送信
  //OSCメッセージ送信
  oscP5.send(msg, myRemoteLocation);
}

//マウスボタンを離した時にメッセージを送信
void mouseReleased(){
  OscMessage msg = new OscMessage("/mouse/cliked");
  msg.add(0); //0を送信
  //OSCメッセージ送信
  oscP5.send(msg, myRemoteLocation);
}
