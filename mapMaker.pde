static int pointX = 16;
static int pointY = 16;
static int refX = 65;
static int refY = 50;
static int sizeX = 800;
static int sizeY = 680;
int weight = 7;
Button reset = new Button("Reset",950,480,150,100);
Button options = new Button("Options", 1105,640,90,50);
Button export = new Button("Export", 1000, 640, 100,50);
Button Import = new Button("Import", 895, 640, 100, 50);
Slider slidX = new Slider(850,250,300,50);
Slider slidY = new Slider (850,350, 300, 50);
ArrayList<Point> points = new ArrayList<Point>();

void setup(){
  options.text_Size = 18;
  export.text_Size = 18;
  Import.text_Size = 18;
  slidX.min = 4;
  slidX.max = 10;
  slidY.min = 4;
  slidY.max = 10;
  size(1200,700);
  background(200);
  for(int i = 0; i < pointX*pointY; i++){
     points.add(new Point(i*20, 20));
  }
}

void draw(){
  Background();
  Import.update();
  reset.update();
  slidX.update();
  slidY.update();
  pointX = int(slidX.value);
  pointY = int(slidY.value);
  options.update();
  export.update();
  update_Lines();
  update_points();
  if(reset.Pressed()){Clear();}
  if(Import.Pressed()){import_data();}
  if(export.Pressed()){export_data();}
  //mouseCursor();
}

public void update_points(){
    for(int i = 0; i < points.size(); i++){
    Point reference = points.get(i);
    reference.x = refX + (i % pointX)*(sizeX/pointX);
    reference.y = refY + (i / pointX)*(sizeY/pointY);
    reference.update();
    mouseCheck(i);
    }
}

public void update_Lines(){
   for(int i = 0; i < points.size(); i++){
    Point reference = points.get(i);
      for(int j = 0; j < 4; j++){    
       if(reference.relation[j] && j == 0){int carlos = i - pointX; //println("Cima");   //Cima?
         Point dest = points.get(carlos);
         strokeWeight(weight);
         stroke(0);
         line(reference.x, reference.y, dest.x, dest.y);
       } else if(reference.relation[j] && j == 1){int carlos = i - 1;  //println("Esquerda");//esquerda?
         Point dest = points.get(carlos);
         strokeWeight(weight);
         stroke(0);
         line(reference.x, reference.y, dest.x, dest.y);
       } else if(reference.relation[j] && j == 2){int carlos = i + 1; // println("Direita");//direita?
         Point dest = points.get(carlos);
         strokeWeight(weight);
         stroke(0);
         line(reference.x, reference.y, dest.x, dest.y);
       } else if(reference.relation[j] && j == 3){int carlos = i + pointX; //println("Baixo");//Baixo?
         Point dest = points.get(carlos);
         strokeWeight(weight);
         stroke(0);
         line(reference.x, reference.y, dest.x, dest.y);
      }    
    }
  }
}

public void Clear(){
    buffer1 = -1;
    buffer2 = -1;
    for(int i = 0; i < points.size(); i++){
      Point ref = points.get(i);
      for(int j = 0; j < 4; j++){
        ref.relation[j] = false;
      }
    }
}
