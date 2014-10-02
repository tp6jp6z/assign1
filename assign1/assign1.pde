SlotMachine machine;
boolean rolling = false;
// button information
boolean button = false;
int x = 640/2;
int y = 440;
int w = 150;
int h = 50;

// declare variables
// --------------------------------------------

// put your code inside here
int totalScore = 500;


// --------------------------------------------

void setup() {
  size(640,480);
  textFont(createFont("fonts/Square_One.ttf", 20));
  machine = new SlotMachine();
}

void draw() {
  background(245,229,124);
  fill(64,162,171);
  rect(320,248,396,154,25);
  fill(253,253,253);
  rect(220,247,97,114,2);
  rect(320,247,97,114,2);
  rect(420,247,97,114,2);
  // draw button
  fill(64,162,171);
  noStroke();
  rectMode(CENTER);
  rect(x,y,w,h,105);
  // show title
  fill(64,64,63);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("Slot Machine",x,49);
  textSize(20);
  text("Score"+" "+":"+" "+totalScore,x, 89);
  
  // event handler
  if (button) {
    if (!rolling){
      rolling = true;
      // start rolling
      // -------------------------------------------------
      totalScore -= 50;

      // -------------------------------------------------
    }
    machine.roll();
    textSize(19);
    text("Stop",x,y);
  
  } else {
    if (rolling){
      rolling = false;
      // stop rolling
      // -------------------------------------------------
      
      // setSlotFruit
      float sevenProbability= pow(0.1,1/3.0);
      int result1= machine.probability(1-(float)sevenProbability);
      int result2= machine.probability(1-(float)sevenProbability);
      int result3= machine.probability(1-(float)sevenProbability);
      
      int d= int(random(1,6)) *result1;
      int e= int(random(1,6)) *result2;
      int f= int(random(1,6)) *result3;
      machine.setSlotFruit(0,d);
      machine.setSlotFruit(1,e);
      machine.setSlotFruit(2,f);
      
      // getSlotScore
      int a= machine.getSlotScore(d);
      int b= machine.getSlotScore(e);
      int c= machine.getSlotScore(f);
      
      int m= machine.getFruitCount(d);
      int n= machine.getFruitCount(e);
      int o= machine.getFruitCount(f);
      
      //totalScore
      totalScore += (a*m + b*n + c*o);
      
      // -------------------------------------------------
    }
    machine.stop();
    fill(253,253,253);
    textSize(19);
    text("Roll",x,y);
  }

}

// When the mouse is pressed, the state of the button is toggled.   
void mousePressed() {
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    button = !button;
  }  
}







