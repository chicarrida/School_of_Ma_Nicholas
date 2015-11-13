class DataPoint{
  
  int transparency = 0;
  boolean female = true;
  boolean take = true;
  int age;
  int x; 
  int y;
  color c;
 
  int look = 2;
  // 1- sporty
  // 2- normal
  // 3- smart
  
  int extra;
  //1- glasses
  //2- headphones
  //3- children
 
 DataPoint(String _take,String _gender, int _age,  String _extra){
   //println("constructor called");
   println("gender: "+_gender);
   if(_gender.charAt(0) == 'm' || _gender.charAt(0) == 'M'){          
     female = false;
     c = color(42,99,19);
     println("set gender to "+female);
   }
   else{
     c = color(245,245,32);
   }
    if(_take.charAt(0) == 'A'){
     take = false;
     println("take");
    }
   
   age = _age;
   extra = getExtra(_extra);
 }
 
public void initialize(int _x, int _y){
//  println("initialized at "+_x+" "+_y+" with gender "+female);
    transparency = 255;
   y = _y;
   x = _x;
 }
 
 public void draw(){
   if(transparency != 0){
     pushMatrix();
     translate(x+50,y+50);
     if(take){
        rotate(radians(180));
        //println("rotieren");
     }
     fill(c, transparency);
     triangle(-50,0,50,-50, 50, 50);    
    if(extra == 3)
     triangle(-50/2,0,50/2,-50/2, 50/2, 50/2); 
    // transparency -= 1;
     popMatrix();
  }
 }
  
  
  private int getLook(char _look){
    
       switch(_look){
    case('n'): 
         return 2;
    case('p'):
         return 1;
    case('s') :
         return 3;
    default: return 2;

}
  }

private int getExtra(String _extra){
  if(_extra.isEmpty())
      return 0;
      
  switch(_extra.charAt(0)){
    case('k'): 
         return 2;
    case('b'):
         return 1;
    case('c') :
         return 3;
    default: return 0;
  }
 }
 
}



