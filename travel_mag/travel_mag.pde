Table t; 
int articles = 0;
int articleWidth  = 0;
int hoffset = 15; 


void setup(){
 t = loadTable("data_from_traveler_mag.csv","header");
 size(1200,900); 
 articles = t.getRowCount();
 articleWidth = height/articles;
}

void draw(){
  noLoop();
  line(250, 0, 250, height);
  for (int i = 0; i < articles; i++){
     fill(124);
    TableRow r = t. getRow(i);
    int y = 100;//hoffset+(articleWidth* i);
    int x = 40*i;
    text(r.getString("title"), x, y);
    float tot = r.getInt("total");
    float ii = r.getInt("i");
    float you = r.getInt("you");
    float quote = r.getInt("quote");
    int greylines = (int)(tot - ii - you - quote);
    for(int j = 0; j < greylines; j++){
     stroke(124);
     line(250+x, y+j, 260+x, y+j); 
    }
   int offset = greylines;
    for(int j = 0; j < ii; j++ ){
       stroke(255,0,0);
      line(250+x, y+offset+j, 260+x, y+offset+j);
    }
    offset = (int)(offset+ii);
     stroke(0,255,0);
    for(int j = 0; j < you ; j++){
     
      line(250+x, y+offset+j, 260+x, y+offset+j);
    }
    offset = (int)(offset + you);
    stroke(0,0,255);
    for(int j = 0; j < quote ; j++){
     
      line(250+x, y+offset+j, 260+x, y+offset+j);
    }
      
    /*line(250, y, 250 +tot, y);
    line(250+tot, y,250+tot, y+ii );
    line(250+tot, y+ii, 250+tot-you, y+ii);
    line(250+tot-you, y+ii, 250+tot-you, y+ii-quote);
   */ 
  }
}
