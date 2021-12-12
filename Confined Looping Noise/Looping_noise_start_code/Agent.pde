class Agent {
  float x, y, z;
  float speed, size;
  
  color col;
  Agent(float _x, float _y) {
    x = _x;
    y = _y;
    
    z = random(0.02, 0.08);
    
    speed = random(0.25, 5);
    size = random(1, 6);
    
    col = cols[(int)random(cols.length)];
  }
  
  void display() {
    stroke(col);
    strokeWeight(size);
    
    point(x, y);
  }
  
  void update() {
    float n = noise(x/noiseScale, y/noiseScale, z);
    float angle = n*noiseStrength;
    x += cos(angle) * speed;
    y += sin(angle) * speed;
       
    z += 0.012;
    
    int coli = (int)map(n, 0.3, 0.6, 0, cols.length);
    col = cols[constrain(coli, 0, cols.length-1)];
    
    display();
    bounds(margin, margin, width-margin, height-margin);
  }
  
  void bounds(float sx, float sy, float w, float h) {
    if (x > w) {
      x = sx;
    }
    if (x < sx) {
      x = w;
    }
    if (y > h) {
      y = sy;
    }
    if (y < sy) {
      y = h;
    }
  }
}
