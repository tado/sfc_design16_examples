import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress location;

void setup() {
  size(400, 400);
  frameRate(60);
  //OSCのセットアップ
  oscP5 = new OscP5(this, 12000);
  //SonicPiの受信ポート4557に送信
  location = new NetAddress("127.0.0.1", 4557);
}

void draw() {
}

void mousePressed() {
  //ド(C)の音を演奏させる
  OscMessage msg = new OscMessage("/run-code");
  msg.add("fromP5");
  msg.add("play 60");
  oscP5.send(msg, location);
  println(msg);
}
