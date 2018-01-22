import java.nio.file.*;

class Window implements Movable {

  float x, y;
  float goalX, goalY;

  float w, h;
  String title;
  
  float fade = 0;

  boolean selected = false;
  
  File file;
  File[] files;

  Window (String title, float xx, float yy) {
    this.title = title;
    goalX = xx;
    goalY =yy;
    w= 300;
    h= 170;

    x = goalX;
    y = -h;

    //Iterable<Path> dirs = FileSystems.getDefault().getRootDirectories();
    //path = dirs[0];
    //for (Path name : dirs) {
    //  print(name);
    //}
    file = new File("/usr");
    file = new File("/Users/jack/Documents/unity/Mirror Mall/Assets");
    
    files = file.listFiles();
    println(files.length);
   
  }

  void draw () {
    fade *= 0.97;
    x += (goalX - x) * 0.25;
    y += (goalY - y) * 0.25;
    canvas.stroke(white);
    
    if (selected) {
      canvas.fill(lightBlack);
    } else {
      canvas.fill(black);
    }
    // main box
    canvas.rect(x, y, w, h);
    canvas.fill(255, fade*55);
    canvas.rect(x,y,w,h);

    //title bar
    canvas.rect(x, y, w, 15);
    canvas.fill(white);
    canvas.textAlign(LEFT, TOP);
    canvas.text("/" + file.getName(), x+20, y); 
    
    canvas.fill(black);
    //leftmost box button
    canvas.rect(x, y, 15, 15);

    // resize box right corner
    canvas.rect(x + w-15, y+ h-15, 15, 15);
    
    canvas.fill(white);
    for(int i =0; (i < files.length && (i+1)*20 < h); i++) {
      canvas.textAlign(LEFT, TOP);
       canvas.text(files[i].getName(), x+10, y+20+ 19*i); 
    }


    selected = false;
  }

  void drawSelected () {
    selected = true;
    draw();
  }
  
  void drag () {
    
  }
}