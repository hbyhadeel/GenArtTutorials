color[] cols = {#4920D1, #EDFF33, #007558, #ADD9FF, #F581ED};
color bg = #0C2C40;

String letters = "abcdefghijklmnopqrstuvwxyz";
String[] punc = {"comma", "dot", "space", "quotes", "exclamation", "question"};

int glyphCount = letters.length() + punc.length;
PShape[] glyphs = new PShape[glyphCount];
int j;

String t = "The only way to deal with an unfree world is to become so absolutely free that your very existence is an act of rebellion.";
int count = ceil(sqrt(t.length()));

float margin = 50;
float xoff, yoff;
float cellw;

void setup() {
  size(1080, 1080);
  background(bg);

  for (int i = 0; i < glyphs.length-punc.length; i++) {
    glyphs[i] = loadShape(letters.charAt(i) + ".svg");
    glyphs[i].disableStyle();
  }

  j = 0;
  for (int i = 26; i < glyphs.length; i++) {
    glyphs[i] = loadShape(punc[j] + ".svg");
    glyphs[i].disableStyle();
    j++;
  }

  cellw = (width-margin*2)/(float)count;
  t = t.toLowerCase();
  for (int i = 0; i < t.length(); i++) {
    char letter = t.charAt(i);

    float x = margin + xoff;
    float y = margin + yoff;
    xoff += cellw;
    if (xoff >= width-margin*2) {
      yoff += cellw;
      xoff = 0;
    }

    stroke(cols[(int)random(cols.length)]);
    fill(cols[(int)random(cols.length)]);

    switch(letter) {
    case ',':
      shape(glyphs[26], x, y, cellw, cellw);
      break;
    case '.':
      shape(glyphs[27], x, y, cellw, cellw);
      break;
    case ' ':
      shape(glyphs[28], x, y, cellw, cellw);
      break;
    case '"':
      shape(glyphs[29], x, y, cellw, cellw);
      break;
    case '!':
      shape(glyphs[30], x, y, cellw, cellw);
      break;
    case '?':
      shape(glyphs[31], x, y, cellw, cellw);
      break;
    default:
      for (int j = 0; j < letters.length(); j++) {
        if (letter == letters.charAt(j)) {
          shape(glyphs[j], x, y, cellw, cellw);
          break;
        }
      }
    }
  }
}

void draw() {
}
