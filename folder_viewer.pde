color black, lightBlack, white, red, yellow, blue, grey;

int realWidth, realHeight;

PGraphics canvas;

PFont font;

int scaleValue= 2;

float circleRota;

ArrayList<Movable> windows;

void setup () {
  //size(displayWidth, displayHeight);
  
  black = color(30, 20, 15);
  white = color(255, 250, 230);
  grey = color(80,80,70);
  red = color(200, 120, 100);
  blue = color(154, 201, 240);
  yellow = color(180, 180, 90);
  lightBlack = color(45, 30 , 30);

  font = loadFont("monaco.vlw");
  
  realWidth =int(displayWidth/scaleValue);
  realHeight = int(displayHeight/scaleValue);
  
  fullScreen();
  noSmooth();
  canvas = createGraphics(realWidth, realHeight);

  windows = new ArrayList<Movable>();
     windows.add(new Window("---", 200, 300));
 // windows.add(new Window("Making a fake OS theme in Processing", 80, 80));
}

void keyPressed () {
 if(key == ' ') {
   windows.add(new Window("---", random(300)+30, random(300)+20));
 }
}

void mousePressed () {
   Window w = (Window)windows.get(windows.size()-1);
   w.fade = 1; 
}


void draw () {
    
  noCursor();
  canvas.beginDraw();
  canvas.strokeWeight(1);
  canvas.background(black); 
  canvas.stroke(lightBlack);
  for (int i = 0; i < realWidth; i += 14) {
   canvas.line(i + 20, 0, i -20, realHeight);
  }

  navBar();
  
  canvas.noFill();
  canvas.stroke(grey);
  canvas.rectMode(CENTER);
  canvas.pushMatrix();
  canvas.translate(640, 200);
  canvas.rotate((second()/60.0) * TWO_PI);
  canvas.rect(0, 0, 100, 100);
  canvas.rotate((second()/60.0) * TWO_PI);
  canvas.rect(20, 20, 80, 80);
  canvas.rectMode(CORNER);
  canvas.popMatrix();
  
  
  circleRota += 0.003;
  canvas.stroke(red);
  canvas.ellipse(600, 400, 100, 100);
  canvas.stroke(yellow);
  canvas.ellipse(620+cos(circleRota)*10, 420+sin(circleRota)*10, 100, 100);  
  
  canvas.stroke(blue);
  canvas.line(100, 100, 700, 700);

 
  
  for(int i =0; i <windows.size(); i++) {
    if(i == windows.size()-1) {
      windows.get(i).drawSelected();
    } else {
   windows.get(i).draw(); 
    }
  }
 
  drawCursor();
  
  canvas.endDraw();
  image(canvas, 0, 0, displayWidth, displayHeight);

}

void navBar () {
  canvas.fill(lightBlack);
  canvas.noStroke();
  canvas.rect(0, 0, realWidth, 20);

  canvas.stroke(white);
  canvas.line(0, 20, realWidth, 20);
  canvas.textAlign(RIGHT, TOP);
  canvas.fill(white);
  canvas.text("OS TIME " + nf(hour(),2)+":" + nf(minute(),2) + ":" + nf(second(),2), realWidth-2, 2);
}

void drawCursor () {
  // mouse last
  int mX= mouseX/scaleValue;
  int mY = mouseY/scaleValue;
  
  canvas.fill(lightBlack);
  canvas.stroke(white);
  canvas.beginShape();
  canvas.vertex(mX, mY);
  canvas.vertex(mX+ 10, mY+10);
  canvas.vertex(mX, mY+15);
  
  canvas.endShape(CLOSE); 
}