Table t; 
int counter = 0;
int xx; 
boolean rects = true;


 float total;
   float ii;
   float you;
   float quote;
   
void setup(){
  t = loadTable("data_from_traveler_mag.csv","header");
  size(1200, 600);
//  colorMode(HSB, 40);
 // rectMode(CENTER);
  xx = width/t.getRowCount();  
  noLoop();
}

void draw(){
  background(120);
  //  drawGrid();
   for(int y = 50; y < height; y += 200){
    for(int x = 50; x < width; x += 200){
       if(counter == t.getRowCount())
         break;
         
      TableRow r = t.getRow(counter);
      drawRow(r, x, y);    
      counter += 1;     
   }
 }
 counter = 0;
 writeText();
}

void drawRow(TableRow r, int x, int y){  
   pushMatrix();
   translate(x, y);
   //if(rects)
   scale(8);
   
   
   total = sqrt(r.getInt("total"));
   ii = sqrt(r.getInt("i"));
   you = sqrt(r.getInt("you"));
   quote = sqrt(r.getInt("quote"));
   noStroke();
   fill(255, 255, 255);
   println(total);
   if(rects)
     rect(0,0,total, total);
   else 
     rect(0,0, 2, total);
  drawI(total);
  drawYou(total);
  drawQuote(total);
   
   popMatrix(); 
}
/*
void startingWithI(){
 drawI();
  if(you > quote)
   drawYou();
  else
   drawQuote(); 
}

void startingWithYou(){
 drawYou();
  if(ii > quote)
    drawI();
  else
   drawQuote(); 
}

void startingWithQuote(){
 drawQuote();
 if(ii > you)
  drawI();
 else 
  drawYou();
}
*/

void drawI(float total){
 fill(255, 0, 0);
 if(rects)
   rect(0, 0, ii, ii);
  else
    rect(0, 0, 2, ii); 
}

void drawYou(float total){
 fill(0,255, 0);
 if(rects)
   rect(total-you, 0, you, you);
 else{   
   rect(0, 0+ii, 2, you);
 } 
}

void drawQuote(float total){
 fill(0, 0, 255);
 if(rects){
   rect(total-quote, total-quote, quote, quote);
 }
else{
  rect(0, (0+ ii +you), 2, quote);
}
}

void drawGrid(){
  stroke(0);
  for(int x = 200; x < width; x += 200){
   line(x, 0, x, height);
  }

  for(int y = 200; y < height; y += 200){
   line(0, y, width, y); 
  }
}

void writeText(){
  noStroke();
  fill(255,255,255);
  text("Lines in Total",50,450);
  fill(255,0,0);
  text( "Lines containing 'I'", 50, 490);
  fill(0,255,0);
  text( "Lines containing 'you'", 50, 530);
  fill(0,0, 255);
  text( "Lines containing 'quotes'", 50, 570);
}

void mousePressed(){
  
 rects = !rects;
 println("-------------------------------------");
 redraw();
}
