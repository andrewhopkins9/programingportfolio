// Andrew Hopkins | Nov 1 2022 | Calculator
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[13];
String dVal = "0.0";
float l, r, result;
char op = ' ';
boolean left = true;

void setup() {
  size(290, 530);
  background(#CBD9FF);
  // Number Buttons
  numButtons[1] = new Button(40, 280, 60, 60, '1');
  numButtons[2] = new Button(110, 280, 60, 60, '2');
  numButtons[3] = new Button(180, 280, 60, 60, '3');
  numButtons[4] = new Button(40, 350, 60, 60, '4');
  numButtons[5] = new Button(110, 350, 60, 60, '5');
  numButtons[6] = new Button(180, 350, 60, 60, '6');
  numButtons[7] = new Button(40, 420, 60, 60, '7');
  numButtons[8] = new Button(110, 420, 60, 60, '8');
  numButtons[9] = new Button(180, 420, 60, 60, '9');
  numButtons[0] = new Button(110, 490, 60, 60, '0');
  // Other
  opButtons[0] = new Button(40, 490, 60, 60, '.');
  opButtons[1] = new Button(215, 490, 130, 60, '=');
  opButtons[2] = new Button(250, 420, 60, 60, '+');
  opButtons[3] = new Button(250, 350, 60, 60, '-');
  opButtons[4] = new Button(250, 280, 60, 60, 'x');
  opButtons[5] = new Button(250, 210, 60, 60, '÷');
  opButtons[6] = new Button(180, 210, 60, 60, '%');
  opButtons[7] = new Button(40, 140, 60, 60, 'C');
  opButtons[8] = new Button(250, 140, 60, 60, '±');
  // Special
  opButtons[9] = new Button(110, 210, 60, 60, '√');
  opButtons[10] = new Button(40, 210, 60, 60, '³');
  opButtons[11] = new Button(180, 140, 60, 60, 's');
  opButtons[12] = new Button(110, 140, 60, 60, '⁹');
}

void draw() {
  background(#9DB8FF);
  updateDisplay();
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
}

void keyPressed() {
  println("key:" + key);
  println("keycode:" + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);//this is #1
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);//#2
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);//#3
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);//#4
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);//#5
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);//#6
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);//#7
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);//#8
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);//#0
  } else if (keyCode == 48|| keyCode == 96) {
    handleEvent("0", true);//#0
  } else if (keyCode == 107) {//+
    handleEvent("+", false);
  } else if (keyCode == 109) {//-
    handleEvent("-", false);
  } else if (keyCode == 61) {//=
    handleEvent("=", false);
  } else if (keyCode == (106)) {//*
    handleEvent("*", false);
  } else if (keyCode == (111)) {//÷
    handleEvent("/", false);
  } else if (keyCode == (111)) {//÷
    handleEvent("/", false);
  } else if (keyCode == (67)) {//clear
    handleEvent("C", false);
  } else if (keyCode == 46 || keyCode == 110) {//decimal
    handleEvent(".", false);
  }
}

void handleEvent(String val, boolean num) {
  if (num && dVal.length() < 30) {
    if (dVal.equals("0.0")) {
      dVal = val;
    } else {
      dVal += val;
    }
    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("C")) {
    dVal = "0.0";
    l = 0.0;
    r = 0.0;
    left = true;
    op = ' ';
  } else if (val.equals("+")) {
    op = '+';
    dVal = "0.0";
    left = false;
  } else if (val.equals("-")) {
    op = '-';
    dVal = "0.0";
    left = false;
  } else if (val.equals("=")) {
    performCalculation();
  } else if (val.equals("*")) {
    op = 'x';
    dVal = "0.0";
    left = false;
  } else if (val.equals("/")) {
    op = '/';
    dVal = "0.0";
    left = false;
  } else if (val.equals(".")) {
    if (dVal.contains(".") == false) {
      dVal += ".";
    }
  }
}


void mouseReleased() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].on && dVal.length() <30) {
      handleEvent (str(numButtons[i].val), true);
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val== 'C') {
      handleEvent("C", false);
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      op = '+';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '-') {
      op = '-';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == 'x') {
      op = 'x';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '÷') {
      op = '÷';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '=' ) {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      if (left) {
        l=l*-1;
        dVal = str(l);
      } else {
        r = r*-1;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val=='s') {
      if (left) {
        l=sq(l);
        dVal = str(l);
      } else {
        r = sq(r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val=='√') {
      if (left) {
        l=sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val=='³') {
      if (left) {
        l=(l*l*l);
        dVal = str(l);
      } else {
        r = (r*r*r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val=='%') {
      if (left) {
        l=(100*l);
        dVal = str(l);
      } else {
        r = (100*r);
        dVal = str(r);
      }
      } else if (opButtons[i].on && opButtons[i].val=='⁹') {
        if (left) {
          l=(l*l*l*l*l*l*l*l*l);
          dVal = str(l);
        } else {
          r = (r*r*r*r*r*r*r*r*r);
          dVal = str(r);
        }
      }
      println(" l:" + l + " Op:" + op + " R:" +r + " Result:" + result + " left:" +left);
    }
  }


  void updateDisplay() {
    rectMode(CENTER);
    fill(#F5CDCE);
    rect(width/2, 55, width-20, 80, 10);
    if (dVal.length()< 10) {
      textSize(30);
    } else if (dVal.length() < 23) {
      textSize(20);
    } else {
      textSize(15);
    }
    fill(255);
    textAlign(RIGHT);
    text(dVal, width-25, 80);
  }
  void performCalculation() {
    if (op == '+') {
      result = l + r;
    } else if (op == '-') {
      result = l - r;
    } else if (op == 'x') {
      result = l * r;
    } else if (op == '÷') {
      result = l / r;
    }
    dVal = str(result);
    l = result;
    left = true;
  }
