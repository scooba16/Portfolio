class Button {
  //Member Variables
  int x, y, w, h;
  String val;
  boolean over;
  String bType;
  color c1, c2;

  // Constructor
  Button(int x, int y, int w, int h, String val, color c1, color c2, String bType) {
    this.x = x;
    this.y = y;
    this .w = w;
    this.h = h;
    this.val = val;
    over = false;
    this.bType=bType;
    this.c1 = c1;
    this.c2 = c2;
  }

  // Member Methods
  void display() {
    // Rectangle Properties
    rectMode(CENTER);
    if (over == true) {
      fill(c2);
    } else {
      fill(c1);
    }
    strokeWeight(2);
    stroke(50);
    if(bType == "r"){
      rect(x,y,w,h,4);
    } else if (bType == "e"){
      ellipse(x,y,w,h);
    }else {
      quad(x,y - h/2,x + w/2,y,x,y +h/2,x-w/2,y );
    }
    // Text Properties
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(50);
    text(val, x, y);
  }

  boolean hover(int tempX, int tempY) {
    if (x>tempX-w/2 && x<tempX+w/2 && y>tempY - h/2 && y<tempY + h/2) {
      over = true;
      return true;
    } else {
      over = false;
      return false;
    }
  }
}
