import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress location;

float note; //ノート番号
float pan;  //パン

void setup() {
  size(640, 480);
  oscP5 = new OscP5(this, 12000);
  location = new NetAddress("127.0.0.1", 4557);
}

void draw() {
  background(0);
  stroke(255);
  //マウスの位置を表示
  line(mouseX, 0, mouseX, height);
  line(0, mouseY, width, mouseY);
  ellipse(mouseX, mouseY, 10, 10);
  //マウスの位置から、ノート番号とパンを決定
  note = map(mouseY, 0, width, 80, 50);
  pan = map(mouseX, 0, width, -1, 1);
  //テキストで表示
  text("note = " + note + ", pan = " + pan, mouseX + 10, mouseY-10);
}

void mousePressed() {
  //OSCを送信
  OscMessage msg = new OscMessage("/run-code");
  msg.add("fromP5");
  msg.add("play "+ note + ", pan: "+ pan);
  oscP5.send(msg, location);
  println(msg);
}
