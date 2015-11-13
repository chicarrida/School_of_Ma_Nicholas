ArrayList<Attractor> bring = new ArrayList<Attractor>();
ArrayList<Attractor> take = new ArrayList<Attractor>();

ArrayList<Particle> parts = new ArrayList<Particle>();
Table t;

//plug in article data, one attractor per article, particles as line? 

void setup() {
  size(600, 600);
  t = loadTable("data.csv", "header");
  bring.add(new Attractor("get", 2*width/3, height/2, 2, true));
  Attractor a2 = new Attractor("take", width/3, height/2, 2, true);
  take.add(a2);


  background(0);
  for (TableRow row : t.rows()) {
    Particle p;
    String gender = row.getString("geschlecht");
    int age = row.getInt("alter");
    int x = (int)random(age*10-50, age*10);
    int startY = 0;
    int endY = 100;
    int c = color(0,0,255);
    if (gender.charAt(0)=='m') {
      startY = height-100;
      endY = height;
      c = color(255,0,0);
    }
    //float x = random(0, width);
    float y = random(startY, endY);
    if (row.getString("ausleihe").charAt(0)== 'A')
      p = new Particle(x, y, random(4, 10), random(4, 10), take, c);
    else
      p = new Particle(x, y, random(4, 10), random(4, 10), bring, c);

    parts.add(p);
  }
  println("particles"+parts.size());
}

void draw() {
  for (Attractor at : bring)
    at.display();    
  for(Attractor at: take)
    at.display();
  for (Particle p : parts)
    p.display();
}

