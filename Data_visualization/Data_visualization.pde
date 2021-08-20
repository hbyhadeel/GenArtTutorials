import processing.pdf.*;
PFont f;

Table table;

int index;
int xcount, ycount;
float cellw, cellh;

int margin = 20;

color bg = #102D40;
color fg = #FFFCBF;

color top = #7EC261;
color mid = #F2C830;
color bottom = #FF5D4C;

void setup() {
  size(1000, 1000);
  
  //beginRecord(PDF, "Data_Viz.pdf");
  
  background(bg);
  noStroke();
  
  f = createFont("Helvetica", 16);
  
  textSize(16);
  textMode(MODEL);
  textFont(f);
  
  table = loadTable("goodreads_library.csv", "header");
  xcount = 3;
  ycount = table.getRowCount()/xcount;
  cellw = (width-margin*2)/(float)xcount;
  cellh = (height-margin*2)/(float)ycount;
  
  for (TableRow row : table.rows()) {
    String title = row.getString("Title");
    int rating = row.getInt("My Rating");
    
    int i = index/ycount;
    int j = index%ycount;
    
    float xpos = i*cellw + margin;
    float ypos = j*cellh + margin; 
    
    if (rating >= 4) {
      fill(top);
    } else if (rating == 3) {
      fill(mid);
    } else if (rating < 3 && rating > 0) {
      fill(bottom);
    } else if (rating == 0) {
      fill(bg);
    }
    rect(xpos, ypos + cellh/2, cellw, cellh/2);
    
    fill(fg);
    
    int s = title.length();
    while(textWidth(title)+12 > cellw) {
      title = title.substring(0, s)+"...";
      s--; 
    }
    if (textWidth(title) < cellw) {
      text(title, xpos, ypos + cellh/2 + textAscent()/3);
    }
    
    index++;
  }
  
  //endRecord();
}

void draw() {
}
