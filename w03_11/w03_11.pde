//たくさん円を描く

//変数の宣言
int i;

//初期設定
size(800, 600);
background(0);
colorMode(HSB, 360, 100, 100, 100);
noStroke();

//たくさんの円を描く
for (i=0; i<100; i++) {
  float diameter;
  fill(random(200, 240), random(50, 100), random(50, 100), 50);
  diameter = random(50, 200);
  ellipse(random(width), random(height), diameter, diameter);
}