import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress location;

void setup() {
  size(640, 480);
  //OSCのセットアップ
  oscP5 = new OscP5(this, 12000);
  //SonicPiの受信ポート4557に送信
  location = new NetAddress("127.0.0.1", 4557);
  background(0);
}

void draw() {
}

void mousePressed() {
  //マウスのX座標で定位(パン)を決定
  float pan = map(mouseX, 0, width, -1, 1);
  //マウスのY座標でノートナンバーを決定
  float note = map(mouseY, 0, width, 80, 50);
  //OSCメッセージを送信
  OscMessage msg = new OscMessage("/run-code");
  msg.add("fromP5");
  msg.add("play "+ note + ", pan: "+ pan);
  oscP5.send(msg, location);
}
