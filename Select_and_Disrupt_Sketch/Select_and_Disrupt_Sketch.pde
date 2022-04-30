import geomerative.*;

color bgCol = #000000;
color[] cols = {#FF6561, #A6367B, #FFB02B, #F2F2EB, #7798D9, #2B4C8C};

float margin = 50;

RShape grp;
RPoint[][] pos;
ArrayList<Path> paths = new ArrayList<Path>();

float selectX, selectY, selectW, selectH;
boolean startDrawing = false;

long seed = (long)random(10000);

void setup() {
  size(1080, 1080);
  pixelDensity(2);
  background(bgCol); 
  
  println(seed);
  randomSeed(seed);
  noiseSeed(seed);
  
  RG.init(this);
  RG.ignoreStyles();
  
  RG.setPolygonizerLength(30);
  
  grp = RG.loadShape("select & distruct intro curves.svg");
  grp.centerIn(g, margin, 1, 1);
  pos = grp.getPointsInPaths();
  
  for (int i = 0; i < pos.length; i++) {
    Point[] points = new Point[pos[i].length];
    for (int j = 0; j < pos[i].length; j++) {
      points[j] = new Point(pos[i][j].x, pos[i][j].y);
    }
    paths.add(new Path(points));
  }
  
  noFill();
  stroke(255);
}

void draw() {
  background(bgCol);
  
  if (startDrawing) {
    selectW = mouseX;
    selectH = mouseY;
  }
  
  mouse(paths.get(0).guideCol, 10);
  showSelection(selectX, selectY, selectW, selectH);
  guides();
  
  translate(width/2, height/2);
  //RG.shape(grp);
  
  for (Path path : paths) {
    path.update(selectX-width/2, selectY-height/2, selectW-width/2, selectH-height/2);
    path.display();
  }
  
}

void showSelection(float x, float y, float w, float h) {
  beginShape();
  vertex(x, y);
  vertex(w, y);
  vertex(w, h);
  vertex(x, h);
  endShape(CLOSE);
}

void mouse(color col, float lineW) {
  push();
  noFill();
  stroke(col);
  line(mouseX-lineW, mouseY, mouseX+lineW, mouseY);
  line(mouseX, mouseY-lineW, mouseX, mouseY+lineW);
  pop();
}

void guides() {
  push();
  fill(255);
  noStroke();
  text(selectX+", "+selectY, selectX, selectY);
  text(selectW+", "+selectH, selectW, selectH);
  pop();
}

void mousePressed() {
  startDrawing = !startDrawing;
  if (startDrawing) {
    selectX = mouseX;
    selectY = mouseY;
  } else {
    selectW = mouseX;
    selectH = mouseY;
  }
}
