class Agent {
  float x, y, z;
  float cellx, celly, w, h;
  float speed, size;
  
  Noise noise;
  
  color col;
  Agent(float _x, float _y, float _w, float _h) {
    x = _x;
    y = _y;
    
    cellx = x;
    celly = y;
    w = cellx + _w;
    h = celly + _h;
    
    noise = new Noise(random(2, 10));
    noise.init();
    
    z = random(0.02, 0.08);
    
    speed = random(0.25, 2);
    size = random(1, 15);
    
    col = cols[(int)random(cols.length)];
  }
  
  void display() {
    stroke(col);
    strokeWeight(size);
    
    point(x, y);
  }
  
  void update() {
    int index = (frameCount-1) % noise.nVals.size();
    float n = noise.nVals.get(index);
    float angle = n;
    x += cos(angle) * speed;
    y += sin(angle) * speed;
    
    z += 0.012;
    
    display();
    bounds();
  }
  
  void bounds() {
    x = constrain(x, cellx, w);
    y = constrain(y, celly, h);
  }
}
