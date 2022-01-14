class Agent {
  // agent parameters
  PVector pos;
  float size, speed;
  color col;
  
  // to reverse direction when outside bounds
  int dir = 1;
  
  Agent() {
    float x = random(margin, width-margin);
    float y = random(margin, height-margin);
    pos = new PVector(x, y);
    
    size = random(1, 5);
    speed = random(1, 5);

    col = cols[(int)random(cols.length)];
  }
  
  void style() {
    strokeWeight(size);
    stroke(col);
    noFill();
  }
  
  void display() { 
    style();
    point(pos.x, pos.y);
  }
  
  void update() {
    float angle = noise(pos.x/noiseScale, pos.y/noiseScale) * noiseStrength;
    
    pos.x += cos(angle) * speed * dir;
    pos.y += sin(angle) * speed * dir;
    
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
