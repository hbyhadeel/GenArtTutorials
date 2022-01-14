class Agent {
  // agent parameters
  PVector pos;
  float size, speed;
  color col;
  
  // reverse direction when outside bounds
  int dir = 1;
  
  Agent() {
    float x = random(margin, width-margin);
    float y = random(margin, height-margin);
    pos = new PVector(x, y);
    
    size = random(5, 50);
    speed = random(10, 20);

    col = cols[(int)random(cols.length)];
  }
  
  void style() {
    strokeWeight(size);
    strokeCap(SQUARE);
    strokeJoin(SQUARE);
    stroke(col);
    noFill();
  }
  
  void display(int steps) { 
    style();
    beginShape();
    for (int i = 0; i < steps; i++) {
      update();
    }
    endShape();
  }
  
  void update() {
    float angle = noise(pos.x/noiseScale, pos.y/noiseScale) * noiseStrength;
    float angle2 = atan2(curly-pos.y, curlx-pos.x);
    pos.x += cos(angle2-HALF_PI) * speed * dir;
    pos.y += sin(angle + angle2-HALF_PI) * speed * dir;
    
    vertex(pos.x, pos.y);
    
    bounds();
  }
  
  void bounds() {
    if (pos.x < margin || pos.y < margin ||
      pos.x > width-margin || pos.y > height-margin) {
      dir = -dir;
    }

    pos.x = constrain(pos.x, margin, width-margin);
    pos.y = constrain(pos.y, margin, height-margin);
  }
  
}
