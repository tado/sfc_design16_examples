import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress location;

float note;
float pan;

ArrayList<Ring> rings;
int MAX = 16;

void setup() {
  size(800, 600);
  frameRate(60);
  oscP5 = new OscP5(this, 12000);
  location = new NetAddress("127.0.0.1", 4557);
  rings = new ArrayList<Ring>();
}

void draw() {
  background(0);
  int speed = 8;
  if (frameCount % speed == 0) {
    note = int(random(50, 80));
    pan = random(-1, 1);
    OscMessage msg 
             = new OscMessage("/run-code");
    msg.add("fromP5"+frameCount);
    msg.add("play "+ note + ", pan: "+ pan);
    oscP5.send(msg, location);
    println(msg);
    
    float x = map(pan, -1, 1, 
                  width/4, width/4*3);
    float y = map(note, 40, 90, height, 0);
    PVector location = new PVector(x, y);
    Ring r = new Ring(location);
    r.release = 3.0;
    rings.add(r);
  }
  
  for (int i = 0; i < rings.size(); i++) {
    rings.get(i).draw();
  }
  if (rings.size() > MAX) {
    rings.remove(0);
  }
}

class Ring {
  PVector location;
  float radius;
  float speed;
  float alpha;
  float alphaSpeed;
  float release;
  
  Ring(PVector _location) {
    location = new PVector();
    location = _location;
    radius = 20;
    speed = 1.0;
    alpha = 255;
    alphaSpeed = 1.0;
  }

  void draw() {
    alphaSpeed = 255.0/(release*frameRate);
    fill(63, 127, 255, alpha);
    noStroke();
    pushMatrix();
    translate(location.x, location.y);
    ellipse(0, 0, radius, radius);
    popMatrix();
    radius += speed;
    alpha -= alphaSpeed;
    strokeWeight(1.0);
  }
}