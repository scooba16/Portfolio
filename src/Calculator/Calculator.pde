// Lucas Wu | 9/25/25 | Calculator Project
Button[] numButtons = new Button[10];
Button[] buttons = new Button[19];
float l, r, result;
String dVal;
String op;
boolean left;

void setup() {
  size(420, 610);
  background(#2260e6);
  l = 0;
  r = 0;
  result = 0;
  dVal = "0";
  op = " ";
  left = true;

  numButtons[0] = new Button(90, 480, 140, 60, "1", #D3AF37, #f7d92a, "r");
  buttons[0] = new Button(50, 160, 60, 60, "±", #D3AF37, #f7d92a, "r");
  buttons[1] = new Button(130, 160, 60, 60, "C", #D3AF37, #f7d92a, "e");
  numButtons[1] = new Button(50, 400, 60, 60, "6", #D3AF37, #f7d92a, "e");
  numButtons[2] = new Button(130, 400, 60, 60, "8", #D3AF37, #f7d92a, "r");
  numButtons[3] = new Button(210, 400, 60, 60, "3", #D3AF37, #f7d92a, "e");
  numButtons[4] = new Button(50, 320, 60, 60, "2", #D3AF37, #f7d92a, "r");
  numButtons[5] = new Button(50, 240, 60, 60, "9", #D3AF37, #f7d92a, "e");
  numButtons[6] = new Button(130, 320, 60, 60, "4", #D3AF37, #f7d92a, "e");
  numButtons[7] = new Button(210, 320, 60, 60, "7", #D3AF37, #f7d92a, "r");
  numButtons[8] = new Button(130, 240, 60, 60, "5", #D3AF37, #f7d92a, "r");
  numButtons[9] = new Button(210, 240, 60, 60, "0", #D3AF37, #f7d92a, "e");
  buttons[2] = new Button(210, 160, 60, 60, "||", #D3AF37, #f7d92a, "r");
  buttons[3] = new Button(290, 160, 60, 60, "√", #D3AF37, #f7d92a, "e");
  buttons[4] = new Button(370, 160, 60, 60, "^", #D3AF37, #f7d92a, "r");
  buttons[5] = new Button(290, 240, 60, 60, "÷", #D3AF37, #f7d92a, "r");
  buttons[6] = new Button(370, 240, 60, 60, "F", #D3AF37, #f7d92a, "e");
  buttons[7] = new Button(290, 320, 60, 60, "×", #D3AF37, #f7d92a, "e");
  buttons[8] = new Button(370, 320, 60, 60, "?", #D3AF37, #f7d92a, "r");
  buttons[9] = new Button(290, 400, 60, 60, "+", #D3AF37, #f7d92a, "r");
  buttons[10] = new Button(370, 440, 60, 140, "-", #D3AF37, #f7d92a, "e");
  buttons[11] = new Button(370, 320, 60, 60, "R", #D3AF37, #f7d92a, "r");
  buttons[12] = new Button(50, 560, 60, 60, "Z", #D3AF37, #f7d92a, "r");
  buttons[13] = new Button(130, 560, 60, 60, "O", #D3AF37, #f7d92a, "r");
  buttons[14] = new Button(210, 560, 60, 60, "O", #D3AF37, #f7d92a, "r");
  buttons[15] = new Button(290, 560, 60, 60, "G", #D3AF37, #f7d92a, "r");
  buttons[16] = new Button(370, 560, 60, 60, " ", #D3AF37, #f7d92a, "e");
  buttons[17] = new Button(210, 480, 60, 60, ".", #D3AF37, #f7d92a, "q");
  buttons[18] = new Button(290, 480, 60, 60, "=", #D3AF37, #f7d92a, "q");
}

void draw() {
  background(#4698db);
  for (int i=0; i < buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i < numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void mousePressed() {
  //calculation buttons
  for (int i = 0; i <buttons.length; i++) {
    if (buttons[i].over && buttons[i].val.equals("+")) {
      dVal = "0";
      left = false;
      op = "+";
    } else if (buttons[i].over && buttons[i].val.equals("=")) {
      preformCalculation();
    } else if (buttons[i].over && buttons[i].val.equals("√")) {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (buttons[i].over && buttons[i].val.equals(".")) {
      if (dVal.contains(".") == false) {
        dVal += ".";
      }
    } else if (buttons[i].over && buttons[i].val.equals("||")) {
      if (left) {
        l = abs(l);
        dVal = str(l);
      } else {
        r = abs(r);
        dVal = str(r);
      }
    } else if (buttons[i].over && buttons[i].val.equals("-")) {
      dVal = "0";
      left = false;
      op = "-";
    } else if (buttons[i].over && buttons[i].val.equals("×")) {
      dVal = "0";
      left = false;
      op = "×";
    } else if (buttons[i].over && buttons[i].val.equals("^")) {
      dVal = "0";
      left = false;
      op = "^";
    } else if (buttons[i].over && buttons[i].val.equals("÷")) {
      dVal = "0";
      left = false;
      op = "÷";
    } else if (buttons[i].over && buttons[i].val.equals("F")) {
      dVal = "0";
      left = false;
      op = "F";
    } else if (buttons[i].over && buttons[i].val.equals("R")) {
      dVal = "0";
      left = false;
      op = "R";
    } else if (buttons[i].over && buttons[i].val.equals("C")) {
      l = 0.0;
      r = 0.0;
      result = 0.0;
      dVal = "0";
      op = " ";
      left = true;
    } else if (buttons[i].over && buttons[i].val.equals("±")) {
      if (left) {
        l = l*=-1;
        dVal = str(l);
      } else {
        r = r*=-1;
        dVal = str(r);
      }
    }
  }

  //Number Buttons

  for (int i = 0; i<numButtons.length; i ++) {
    if (dVal.length()<14) {
      if (numButtons[i].over && left == true) {
        if (dVal.equals("0")) {
          dVal = (numButtons[i].val);
          l = float(dVal);
        } else {
          dVal += (numButtons[i].val);
          l = float(dVal);
        }
      } else if (numButtons[i].over && left == false) {
        if (dVal.equals("0")) {
          dVal = (numButtons[i].val);
          r = float(dVal);
        } else {
          dVal += (numButtons[i].val);
          r = float(dVal);
        }
      }
    }
  }

  println("l:" + l);
  println("r:" + r);
  println("result:" + result);
  println("left:" + left);
  println("op:" + op);
}

void updateDisplay() {
  rectMode(CORNER);
  rect(20, 20, 380, 90, 5);
  fill(0);
  textSize(75);
  textAlign(RIGHT);
  if (dVal.length()>8) {
    textSize(20);
  } else if (dVal.length()>9) {
    textSize(25);
  } else if (dVal.length()>10) {
    textSize(16);
  } else if (dVal.length()>11) {
    textSize(14);
  }
  text(dVal, width-25, 90);

  //text(dVal, 20, 20, 380, 90);
}

void preformCalculation() {
  if (op.equals("+")) {
    result = l + r;
  } else if (op.equals("-")) {
    result = l - r;
  } else if (op.equals("×")) {
    result = l * r;
  } else if (op.equals("÷")) {
    result = l / r;
  } else if (op.equals("^")) {
    result = pow(l, r);
  } else if (op.equals("F")) {
    result = floor(l);
  } else if (op.equals("R")) {

    result = ceil(l);
  }
  dVal = str(result);
}
