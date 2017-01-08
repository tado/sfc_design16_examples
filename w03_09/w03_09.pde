//似たような色相で色を塗る

//変数の宣言
int i;

//初期設定
size(800, 600);
colorMode(HSB, 360, 100, 100);
noStroke();

//似たような色相で色を塗る
for (i=0; i<800; i++) {
  fill(random(200, 220), random(100), random(100));
  rect(i*1, 0, 1, 600);
}