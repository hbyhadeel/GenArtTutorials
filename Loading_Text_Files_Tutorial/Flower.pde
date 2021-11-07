class Flower {
  int len;
  String s;
  PVector[] pos;
  float[] radii;
  
  float slice, cx, cy;
  float rAngle, rSpeed, rand;
  
  float minS = 0;
  float maxS = 255;
  float minR = 30;
  float maxR = 70;
  
  float size;
  color col;
  
  Flower (String _s, float _cx, float _cy) {
    s = _s;
    len = s.length();
    pos = new PVector[len];
    radii = new float[len];
    
    slice = radians(360/(float)len);

    cx = _cx;
    cy = _cy;
    
    init();
    
    rand = random(1);
    rAngle = random(TWO_PI);
    rSpeed = random(0.01, 0.05);
    
    size = random(0.25, 1);
    col = cols[(int)random(cols.length)];
  }
  
  void init() {
    for (int i = 0; i < len; i++) {
      float angle = i * slice;
      radii[i] = byte(s.charAt(i));
      radii[i] = map(radii[i], minS, maxS, minR, maxR);
      
      float xpos = cos(angle) * radii[i];
      float ypos = sin(angle) * radii[i];
      pos[i] = new PVector(xpos, ypos);
    }
  }
  
  void style(boolean f) {
    if (f) {
      noStroke();
      fill(col);
    } else {
      noFill();
      strokeWeight(size);
      stroke(col);
    }
  }
  
  void display() {
    beginShape();
    curveVertex(pos[len-1].x, pos[len-1].y);
    for (int i = 0; i < len; i++) {
      char c = s.toLowerCase().charAt(0);
      switch (c) {
        case 'a': case 'e': case 'i': case 'o': case 'u':
        style(true);
        break;
        
        default:
        style(false);
        break;
      }
      curveVertex(pos[i].x, pos[i].y);
      
    }
    curveVertex(pos[0].x, pos[0].y);
    curveVertex(pos[1].x, pos[1].y);
    endShape();
  }
  
  void update() {
    push();
    if (rand > 0.5) rAngle += rSpeed;
    else rAngle -= rSpeed;
    translate(cx, cy);
    rotate(rAngle);
    display();
    pop();
  }
}
