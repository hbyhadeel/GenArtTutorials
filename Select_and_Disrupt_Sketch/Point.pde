class Point extends PVector {
  float xstep, ystep;

  color col = color(255);
  float strokeW;
  Point(float _x, float _y) {
    x = _x;
    y = _y;

    xstep = random(-0.5, 0.5);
    ystep = random(-0.5, 0.5);

    strokeW = 3;
  }

  void setCol(color _col) {
    col = _col;
  }

  void display() {
    push();
    strokeWeight(abs(strokeW));
    stroke(col);
    noFill();
    circle(x, y, 10);
    pop();
  }

  void update() {
    float nScl = 100;
    float angle = noise(x/nScl, y/nScl) * 1000;
    x += cos(angle) * xstep;
    y += sin(angle) * ystep;

    strokeW += cos(angle) * xstep;
  }

  boolean selected(float _x, float _y, float _w, float _h) {
    // left, up
    if (_x < _w || _y < _h) {
      if (x > _x && y > _y && x < _w && y < _h) {
        return true;
      }
    }
        
    // right, up
    if (_x > _w || _y < _h) {
      if (x < _x && y > _y && x > _w && y < _h) {
        return true;
      }
    }
    
    // left, down
    if (_x < _w || _y > _h) {
      if (x > _x && y < _y && x < _w && y > _h) {
        return true;
      }
    }
    
    // right, down
    if (_x > _w || _y > _h) {
      if (x < _x && y < _y && x > _w && y > _h) {
        return true;
      }
    }
    return false;
  }
}
