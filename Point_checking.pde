int buffer1 = -1;
int buffer2 = -1;

public void mouseCheck(int i){
  Point reference = points.get(i);
  drawline(reference.x, reference.y, i);
  if(reference.clicked()){
    if(buffer1 == -1){
      buffer1 = i;
      buffer2 = i;
    } else {
      buffer2 = i;
    }
  }
  if(buffer1 != buffer2){
    boolean buf = (buffer2 - buffer1) > 0;
    int bufAbs = abs(buffer2 - buffer1);
     Point reference1 = points.get(buffer1);
     Point reference2 = points.get(buffer2);
    if((bufAbs == 1) && !buf){
       //Esquerda
       //println("Esquerda");
            if(reference1.relation[1] == false && reference2.relation[2] == false){reference1.relation[1] = true;  reference2.relation[2]= true;} 
       else if(reference1.relation[1] == true && reference2.relation[2] == true){reference1.relation[1] = false;  reference2.relation[2] = false;}
       reset();
    } else if((bufAbs == 1) && buf){
       //Direita
       //println("Direita");
            if(reference1.relation[2] == false && reference2.relation[1] == false){reference1.relation[2] = true;  reference2.relation[1] = true;} 
       else if(reference1.relation[2] == true && reference2.relation[1] == true){reference1.relation[2] = false;  reference2.relation[1] = false;}
       reset();
    } else if((bufAbs == pointX) && !buf){
       //Cima
       //println("Cima");
            if(reference1.relation[0] == false && reference2.relation[3] == false){reference1.relation[0] = true;  reference2.relation[3] = true;} 
       else if(reference1.relation[0] == true && reference2.relation[3] == true){reference1.relation[0] = false;  reference2.relation[3] = false;}
       reset();
    } else if((bufAbs == pointX) && buf){
       //Baixo
       //println("Baixo");
             if(reference1.relation[3] == false && reference2.relation[0] == false){reference1.relation[3] = true;  reference2.relation[0] = true;} 
       else if(reference1.relation[3] == true && reference2.relation[0] == true){reference1.relation[3] = false;  reference2.relation[0] = false;}
       reset();
    } else {
      println("ERROR");
      reset();
    }
  }
}

public void drawline(int x, int y, int i){
  if(buffer1 == i){
    strokeWeight(weight);
    line(x,y, mouseX, mouseY);
  }
}



public void reset(){
 Point reference = points.get(buffer2);
 reference.collision = false;
 buffer1 = -1;
 buffer2 = -1;
}
