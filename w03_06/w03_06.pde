size(800, 800); 
background(0); 
noStroke();
fill(0, 127, 255, 30); 

float diameter;
diameter = width/1.8;

translate(width/2, height/2);
rotate(PI/4);
for (int i = 0; i < 256; i++) { 
  ellipse(diameter / -2, 0, diameter, diameter); 
  ellipse(diameter / 2, 0, diameter, diameter); 
  diameter = diameter / 1.05;
  rotate(PI / 24.0);
}