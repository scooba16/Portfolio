class Button {
  // Member variables
  int x,y,w,h;
  String val;
  boolean hover,isRect;
  color c1, c2;
  
  // Constructor
  Button(int x, int y, int w, int h, String val, color c1, color c2, boolean isRect) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    hover = false;
    this.isRect = isRect;
    this.c1 = c1;
    this.c2 = c2;
  }
  
  // Member Methods
  void display() {
    // Rectangle properties
     rectMode(CENTER);
     if (hover == true){
       fill(c2);
     }  else {
       fill(c1);
     } 
     if (isRect == true){
       rect(x,y,w,h, 5);
     } else {
       ellipse(x,y,w,h);
     }
     
    // Text properties
     fill(255);
     textAlign(CENTER, CENTER);
     textSize(30);
     text(val,x,y-5);
  }
 
  
    void hover(int tempX, int tempY) {
      if (x>tempX - w/2 && x<tempX + w/2 && y>tempY - h/2 && y<tempY + h/2) {
        hover = true;
      } else {
        hover = false; 
         
      }
    
  }
  
}
