class Path {
  Point[] points;
  
  color col, guideCol;
  
  Path(Point[] _points) {
    points = _points;
    
    col = cols[(int)random(cols.length)];
    guideCol = cols[(int)random(cols.length)];
    while(guideCol == col) guideCol = cols[(int)random(cols.length)];
  }
  
  void display() {
    push();
    
    stroke(col);
    strokeWeight(60);
    strokeJoin(ROUND);
    noFill();
    
    beginShape();    
    for (int i = 0; i < points.length; i++) {
      vertex(points[i].x, points[i].y);
    }
    endShape();
    
    pop();
    
    for (Point p : points) {
      p.setCol(guideCol);
      p.display();
    }
  }
  
  void update(float _x, float _y, float _w, float _h) {
    for (int i = 0; i < points.length; i++) {
      Point p = points[i];
      
      if (p.selected(_x, _y, _w, _h)) {
        p.update();
      }
    }
  }
}
