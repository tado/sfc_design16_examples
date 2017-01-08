int NUM = 5000; //線の数
PVector[] rotate = new PVector[NUM]; //角度を保存する配列
color[] col = new color[NUM]; //色を保存する配列

void setup() {
  size(600, 600, P3D);
  frameRate(60);
  colorMode(HSB, 360, 100, 100, 100);
  for (int i=0; i<NUM; i++) {
    //ランダムな角度を生成
    rotate[i] = new PVector(random(360), random(360), random(360));
    //ランダムな色を生成
    col[i] = color(random(120, 260), 70, 100, 30);
  }
}

void draw() {
  background(0);
  noFill();
  translate(width/2, height/2);
  rotateY(frameCount / 1000.0);
  for (int i=0; i<NUM; i++) {
    pushMatrix();
    //生成した角度で線を回転
    rotateZ(radians(rotate[i].z));
    rotateY(radians(rotate[i].y));
    rotateX(radians(rotate[i].x));
    stroke(col[i]);
    //線を描画 (マウスの位置で線の長さを変化させる)
    line(-mouseX/8, -mouseY/8, width/3, mouseX/8, mouseY/8, width/3);
    popMatrix();
  }
}