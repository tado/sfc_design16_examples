//初期条件の設定
size(800, 600);
background(0);
noStroke();
smooth();
fill(0, 127, 255, 40);

float x, y, diameter;
x = width / 2;
y = height / 2;
diameter = height;
int i;

//同心円を描いていく
for (i=0; i<32; i++) {
  ellipse(x, y, diameter, diameter);
  diameter = diameter / 1.2;
}