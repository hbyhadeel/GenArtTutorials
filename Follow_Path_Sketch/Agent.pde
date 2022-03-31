class Agent {
  PVector pos;
  
  color col;
  
  Agent(float x, float y) {
    pos = new PVector(x, y);
    
    col = cols[(int)random(cols.length)];
  }
  
  void guides() {
    push();
    fill(0, 255, 0);
    noStroke();
    circle(pos.x, pos.y, 10);
    pop();
  }
  
  void setCol(int index) {
    col = cols[index];
  }
  
  float calcAngle(PVector pre, PVector pos) {
    return atan2(pre.y-pos.y, pre.x-pos.x);
  }
  
  void brush(float angle, float lineWidth) {
    push();
    stroke(col);
    translate(pos.x, pos.y);
    rotate(angle-HALF_PI);
    //text('A', 0, 0);
    line(-lineWidth/2, 0, lineWidth/2, 0);
    pop();
  }
}
