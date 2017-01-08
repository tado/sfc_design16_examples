//Walkerクラスのオブジェクトの宣言
Walker walker;

void setup() {
  size(800, 600);
  frameRate(60);

  //クラスをインスタンス化
  walker = new Walker();

  background(0);
}

void draw() {
  //Walkerクラスのdraw()メソッドを実行
  walker.draw();
}

class Walker {
  PVector location;
  PVector velocity;

  Walker() {
    location = new PVector(width/2, height/2);
    velocity = new PVector();
  }

  //ランダムウォークを描画
  void draw() {
    for (int i = 0; i < 10; i++) {
      velocity.x = random(-1, 1);
      velocity.y = random(-1, 1);
      location.add(velocity);
      noStroke();
      fill(0, 127, 255, 31);
      ellipse(location.x, location.y, 2, 2);
    }
  }
}