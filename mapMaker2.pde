static int pointX = 8;
static int pointY = 8;
static int PointSize = 10;
int[][] pointsX = new int[pointX][pointY];
int[][] pointsY = new int[pointX][pointY];

int[] navX = new int[pointX*pointY];
int[] navY = new int[pointX*pointY];

Button reset = new Button("Reset",950,480,150,100); //<>//
Button options = new Button("Options", 1120,640,70,50);
Slider slidX = new Slider(850,250,300,50);
PVector Point1;
PVector Point2;

void setup(){
  options.text_Size = 18;
  slidX.floor = true;
  slidX.min = 5;
  slidX.max = 32;
  Point1 = new PVector();
  Point2 = new PVector();
  size(1200,700);
  background(200);
}

void draw(){
  Background();
  reset.update();
  slidX.update();
  options.update();
  drawPoints(60,60,790,640);
  //drawNav();  
 
  pointX = int(slidX.value);
  pointY = int(slidX.value);
  stroke(0);
  strokeWeight(1);
  line(Point1.x, Point1.y,Point2.x, Point2.y);
  mouseCursor();
}

public void drawPoints(int x, int y, int X, int Y){
  strokeWeight(PointSize);
  for(int j = 0; j < pointY; j++){
    for(int i = 0; i < pointX; i++){
      int m =((X-x)/(pointX-1));
      int n =((Y-y)/(pointY-1));
      int g = x+m*i; 
      int h = y+n*j;
      if(collision(g - PointSize, h - PointSize, g + PointSize, h + PointSize)){
        stroke(255,0,0);
        mClick(g,h);
      } else { //<>//
        stroke(0);
      }      
        point(g,h);
        //navX[i+j*pointY] = g;
        //navY[i+j*pointY] = h;
      //pointsX[i][j] = g; 
      //pointsY[i][j] = h; 
      //println("X: " + i + " | Y: " + j + " PointVal: " + pointsX[pointX-1][pointY-1] + " , " + pointsY[pointX-1][pointY-1]);
      //println("M: " + m + " | N: " + n);
    }
  }
}

public void mClick(int m,int n){
  if(mousePressed && (mouseButton == LEFT)){
    Point1.set(m, n);
  }
  if(mousePressed && (mouseButton == RIGHT)){
    Point2.set(m, n);
  }
}

public void drawNav(){
  for(int i = 0; i < pointX*pointY-1; i++){
    stroke(0);
    strokeWeight(1);
    line(navX[i],navY[i], navX[i+1], navY[i+1]);
  }
}

public boolean collision(int x, int y, int X, int Y){
  if((mouseX > x) && (mouseX < X) && (mouseY > y) && (mouseY < Y)){
    return true;
  } else {
    return false;
  }
}

public void mouseCursor(){
 stroke(0);
 strokeWeight(1);
 cursor(CROSS);
 line(mouseX,0, mouseX,1500);
 line(0, mouseY, 1500, mouseY);
 println("Mx: " + mouseX + " | My: " + mouseY);
}
