Table table;
int CUBESIZE = 100;
int counter = 0;
int heightCounter = 0;
int rows;
int w = 0;
ArrayList<DataPoint> list;

void setup(){
  
  table = loadTable("data.csv", "header");
  rows = table.getRowCount();
  
  println(rows);
  int h = 5;
  w= (int)rows/h;
 // println(w);
  size(w * CUBESIZE,h*CUBESIZE );//+150);
  //rectMode(CENTER);
  list = new ArrayList<DataPoint>();
  setUpData();
  //println("setup done");
  //noLoop();
}




void draw(){
if(counter < rows){
  int x = (counter%w) * CUBESIZE;
    list.get(counter).initialize(x, heightCounter*CUBESIZE);
    counter++;
    if(counter != 0 && counter % w == 0){
      heightCounter += 1;
    }
  }
  for(DataPoint d: list)
      d.draw();
      
     delay(200);
}


void setUpData(){
  for(TableRow r: table.rows()){  
    list.add(new DataPoint(r.getString("ausleihe"),r.getString("geschlecht"),r.getInt("alter"),r.getString("extra"))); 
  } 
}
