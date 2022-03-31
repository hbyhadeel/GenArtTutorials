import geomerative.*;

color bgCol = #000000;
color[] cols = {#FF6561, #A6367B, #FFB02B, #F2F2EB, #7798D9, #2B4C8C};

RShape grp;
RPoint[][] points;

Agent[][] agents;
boolean guides = false;

long seed;

void setup() {
  size(1080, 1080);
  pixelDensity(2);
  background(bgCol);

  seed = (long)random(10000);
  println(seed);
  randomSeed(seed);

  RG.init(this);
  RG.ignoreStyles();
  RG.setPolygonizerLength(10);

  grp = RG.loadShape("A-01.svg");
  grp.centerIn(g, 200, 1, 1);

  points = grp.getPointsInPaths();

  agents = new Agent[points.length][];

  for (int i = 0; i < points.length; i++) {
    agents[i] = new Agent[points[i].length];
    for (int j = 0; j < points[i].length; j++) {
      float x = points[i][j].x;
      float y = points[i][j].y;
      agents[i][j] = new Agent(x, y);
    }
  }

  noFill();
  stroke(255);
  strokeWeight(3);
}

void draw() {
  background(bgCol);
  translate(width/2, height/2);

  for (int i = 0; i < agents.length; i++) {
    for (int j = 0; j < agents[i].length; j++) {
      if (guides) agents[i][j].guides();
      float angle = 0;
      if (j > 0) {
        angle = agents[i][j].calcAngle(agents[i][j-1].pos, agents[i][j].pos);
        agents[i][j].brush(angle, 100);
      } else {
        angle = agents[i][j].calcAngle(agents[i][j+1].pos, agents[i][j].pos);
        agents[i][j].brush(angle-PI, 100);
      }
 
      
    }
  }

  //RG.shape(grp);
}

void mousePressed() {
  guides = !guides;
}
