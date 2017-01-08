//変数の宣言
int i;

//初期設定
size(800, 600);
colorMode(HSB, 360, 100, 100);
noStroke();

//色相を変化させながら四角を描いていく
for (i=0; i<width; i++) {
  fill(i * 360.0/800.0, 100, 100);
  rect(i, 0, 1, height);
}