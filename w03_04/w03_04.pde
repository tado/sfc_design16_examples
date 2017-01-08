size(800, 600);
background(0);
stroke(0);
fill(0, 127, 255, 100);
float x, y, w, h;
x = 0;
y = 0;
w = width;
h = height;

for (int i = 0; i < 32; i++) {
  w = w / 2;
  h = h / 2;
  rect(x, y, w, h);
  rect(x + w, y + h, w, h);
}