//ランダムに色を塗る

//変数の宣言
int i;

//初期設定
size(800, 600);
colorMode(HSB, 360, 100, 100);
noStroke();

//ランダムに色を塗る
for (i=0; i<width; i++) {
  fill(random(360), random(100), random(100));
  rect(i*1, 0, 1, height);
}