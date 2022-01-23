color[] cols = {#2B4C8C, #7798D9, #A6367B, #00343B, #DBB5BE, #FEFFF0, #025951};
color bgCol = #F2F2EB;

ArrayList<Poly> polys = new ArrayList<Poly>();
PVector a, b, c, d;
float margin = 100;


void setup() {
  size(1080, 1080);
  background(bgCol);

  a = new PVector(margin, margin);
  b = new PVector(width-margin, margin);
  c = new PVector(width-margin, height-margin);
  d = new PVector(margin, height-margin);

  polys.add(new Poly(a, b, c, d));

  noLoop();
}

void draw() {
  drawPolys(10);

  for (Poly p : polys) {
    p.display();
  }
}

void drawPolys(int res) {
  ArrayList<Poly> temp = new ArrayList<Poly>();

  if (res > 1) {
    for (Poly p : polys) {
      PVector a = p.pointa();
      PVector b = p.pointb();
      PVector c = p.pointc();
      PVector d = p.pointd();
      PVector e = p.pointe();
      PVector f = p.pointf();
      PVector g = p.pointg();
      PVector h = p.pointh();

      float rnd = random(1);
      if (rnd < 0.25) {
        temp.add(new Poly(a, e, f, d));
        temp.add(new Poly(e, b, c, f));
      } else if (rnd > 0.25 && rnd < 0.75) {
        temp.add(new Poly(a, b, g, h));
        temp.add(new Poly(h, g, c, d));
      } else {
        temp.add(new Poly(a, b, c, d));
      }
    }

    polys = temp;
    res--;
    drawPolys(res);
  }
}
