static int pointX = 4;
static int pointY = 4;
static int refX = 50;
static int refY = 50;
static int sizeX = 500;
static int sizeY = 500;
int weight = 7;
Button reset = new Button("Reset",950,480,150,100); //<>//
Button options = new Button("Options", 1120,640,70,50);
Slider slidX = new Slider(850,250,300,50);
ArrayList<Point> points = new ArrayList<Point>();

void setup(){
  options.text_Size = 18;
  size(1200,700);
  background(200);
  for(int i = 0; i < pointX*pointY; i++){
     points.add(new Point(i*20, 20));
  }
}

void draw(){
  Background();
  reset.update();
  slidX.update();
  options.update();
  update_points();
  if(reset.Pressed()){
    buffer1 = -1;
    buffer2 = -1;
    for(int i = 0; i < points.size(); i++){ //<>//
      Point ref = points.get(i);
      for(int j = 0; j < 4; j++){
        ref.relation[j] = false;
      }
    }
  }
  //mouseCursor();
}

public void update_points(){
  for(int i = 0; i < points.size(); i++){
    Point reference = points.get(i);
    reference.x = refX + (i % pointX)*(sizeX/pointX);
    reference.y = refY + (i / pointX)*(sizeY/pointY);
    reference.update();
    mouseCheck(i);
    for(int j = 0; j < 4; j++){
      int carlos = 0;
     if(reference.relation[j] && j == 0){carlos = i - pointX; println("Cima");   //Cima?
   } else if(reference.relation[j] && j == 1){carlos = i - 1;  println("Esquerda");//esquerda?
   } else if(reference.relation[j] && j == 2){carlos = i + 1;  println("Direita");//direita?
   } else if(reference.relation[j] && j == 3){carlos = i + pointX; println("Baixo");//Baixo?
   } else { break;}
     Point dest = points.get(carlos);
     strokeWeight(weight);
     stroke(0);
     line(reference.x, reference.y, dest.x, dest.y);
    }
  }
}

public void updateLine(){
  
}

public void mouseCursor(){
 stroke(0);
 strokeWeight(1);
 cursor(CROSS);
 line(mouseX,0, mouseX,1500);
 line(0, mouseY, 1500, mouseY);
 println("Mx: " + mouseX + " | My: " + mouseY);
}
