class Agent {
  float x, y;
  float size;
  
  float r, t;
  
  color col;
   
  Agent() {
    r = random(width/2);
    t = random(TWO_PI);
    x = width/2 + cos(t) * r;
    y = height/2 + sin(t) * r;
    
    size = random(0.5, 3);
    col = cols[(int)random(cols.length)];
  }
  
  void display() {
    stroke(col);
    strokeWeight(size);
    point(x, y);
  }
  
  void update() {
    r = map(sin(t*50), -1, 1, 0, width/2-margin);
    x = width/2 + cos(t) * r;
    y = height/2 + sin(t) * r;
    t += 0.0001;
  }
}
