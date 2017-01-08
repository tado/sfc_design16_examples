size(800, 600);
background(0);
stroke(0);
fill(0, 127, 255, 100);
float x, y, diameter;
x = width/4;
y = height/2;
diameter = width/2;

for (int i = 0; i < 32; i++) {
  ellipse(x, y, diameter, diameter);
  ellipse(x + diameter, y, diameter, diameter);
  diameter = diameter / 2;
  x = x / 2;
}