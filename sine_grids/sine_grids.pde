color[] cols = {#F2BBC9, #4971A6, #02732A, #F2BB16, #F27405};

int count = 30;
int area = count*count;
float w, h;
float xa, ya;
float uoff, voff;

float off = 5;

PVector[] pos;
float[] sa;
color[] col;

color bg = #FFF0DC;

void setup() {
  size(1920, 1080);
  background(bg);
  
  //rectMode(CENTER);
  noStroke();
  frameRate(24);

  pos = new PVector[area];
  sa = new float[area];
  col = new color[area];

  w = width/(float)count;
  h = height/(float)count;
  
  uoff = 1;
  voff = 1;

  for (int n = 0; n < area; n++) {
    int i = n%count;
    int j = n/count;


    pos[n] = new PVector(i*w, j*h);
    
    //sa[n] = random(TWO_PI);
    sa[n] = map(i*j, 0, area, -TWO_PI, TWO_PI);
    
    float s = sin(i+j);
    int ii = (int)map(s, -1, 1, 0, cols.length);
    ii = constrain(ii, 0, cols.length-1);
    col[n] = cols[ii];
  }
}

void draw() {
  background(bg);

  for (int n = 0; n < area; n++) {
    float posx = pos[n].x + w/2;
    float posy = pos[n].y + h/2;
    
    xa = map(n, -area, area, 0.1, PI*uoff);
    ya = map(n, -area, area, 0.1, TWO_PI*voff);
    
    float xoff = sin(sa[n] + xa);
    float yoff = abs(sin(sa[n] + ya));
    
    fill(0);
    text(n+1, posx, posy);

    fill(#DED1B6);
    rect(posx + off, posy + off, w * xoff, h * yoff, 15);

    fill(col[n]);
    rect(posx, posy, w * xoff, h * yoff, 15);
  }

  xa += 0.1;
  ya += 0.1;
  uoff += 0.05;
  voff -= 0.01;
  
  // uncomment to save video frames
  //if (frameCount <= 240) {
  //  saveFrame("Output/####.png");
  //} else {
  //  exit();
  //}
}
