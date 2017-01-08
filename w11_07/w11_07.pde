import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress location;

float note;
float pan;

void setup() {
  size(640, 480);
  frameRate(60);
  oscP5 = new OscP5(this, 12000);
  location = new NetAddress("127.0.0.1", 4557);
}

void draw() {
  background(0);
  int speed = 8;
  //8フレームに一度実行
  if (frameCount % speed == 0) {
    //ランダムなノート番号とパンを設定
    note = random(50, 80);
    pan = random(-1, 1);
    //OSCを送信
    OscMessage msg = new OscMessage("/run-code");
    msg.add("fromP5"+frameCount);
    msg.add("play "+ note + ", pan: "+ pan);
    oscP5.send(msg, location);
    println(msg);
  }
}
