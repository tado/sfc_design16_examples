//たくさんの四角形を描く

//変数の宣言
int i;
//初期設定
size(800, 600);
background(0);
colorMode(HSB, 360, 100, 100, 100);
rectMode(CENTER);
noStroke();
//たくさんの四角形を描く
for (i=0; i<100; i++) {
  fill(random(0, 40), random(50, 100), random(50, 100), 50);
  rect(random(800), random(600), random(5, 200), random(5, 200));
}