class Poly {
  PVector a, b, c, d;
  int OFFSET = 10;
  float aoff, boff, coff, doff;
  
  color col;
  
  Poly(PVector _a, PVector _b, PVector _c, PVector _d) {
    a = _a;
    b = _b;
    c = _c;
    d = _d;
    
    aoff = random(-OFFSET, OFFSET);
    boff = random(-OFFSET, OFFSET);
    coff = random(-OFFSET, OFFSET);
    doff = random(-OFFSET, OFFSET);
    
    col = cols[(int)random(cols.length)];
  }
  
  void display() {
    fill(col);
    beginShape();
    vertex(a.x + aoff, a.y + aoff);
    vertex(b.x + boff, b.y + boff);
    vertex(c.x + coff, c.y + coff);
    vertex(d.x + doff, d.y + doff);
    endShape(CLOSE);
  }
  
  PVector pointa() {
    return a.copy();
  }
  
  PVector pointb() {
    return b.copy();
  }
  
  PVector pointc() {
    return c.copy();
  }
  
  PVector pointd() {
    return d.copy();
  }
  
  PVector pointe() {
    PVector e = PVector.lerp(a, b, random(0.25, 0.75));
    return e;
  }
  
  PVector pointf() {
    PVector f = PVector.lerp(c, d, random(0.25, 0.75));
    return f;
  }
  
  PVector pointg() {
    PVector g = PVector.lerp(b, c, random(0.25, 0.75));
    return g;
  }
  
  PVector pointh() {
    PVector h = PVector.lerp(a, d, random(0.25, 0.75));
    return h;
  }
}
