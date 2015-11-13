// - - - - - - - - - - - - - - - - - - - - - - - 
// ATTRACTOR CLASS
// - - - - - - - - - - - - - - - - - - - - - - - 
class Attractor { 
  String name;
  PVector location_n;
  int frequency;
  boolean attractorDraw;
  int attractorSize = 3;
  int magnetism = 300;
  // Arguments
  Attractor(String name_, float xPosition_, float yPosition_, int frequency_, boolean draw) {
    name = name_;
    println("pos "+xPosition_+" "+yPosition_);
    location_n = new PVector(xPosition_,yPosition_);
    frequency = frequency_;
    attractorDraw = draw;
  }
  
  void setForce(int force){
   magnetism = force; 
  }

  // Display Attractors
  void display() {
    if (attractorDraw) {
      noStroke();
      fill(255,0,0);
      //if (attractorScale) {
        ellipse(location_n.x, location_n.y, 2*(sqrt(attractorSize*frequency/PI)), 2*(sqrt(attractorSize*frequency/PI)));
      //} 
      //else {
       // ellipse(location_n.x, location_n.y, attractorSize, attractorSize);
      //}
      if (frequency > 0) {
        fill(255);
        textSize(9);
       // if (labelDraw) {
          text(name, location_n.x + (sqrt(attractorSize*frequency/PI)) + 4, location_n.y + 4);
     //   }
      }
    }
  }
}

