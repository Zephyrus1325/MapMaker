class Point{
  public int x;
  public int y;
  public int[] default_color = new int[3];
  public int[] select_color = new int[3];
  public int[] click_color = new int[3];
  public int size = 20;
  public boolean collision = true;
  public boolean[] relation = new boolean[4]; //0 = cima | 1 = esquerda | 2 = direita | 3 = baixo 
  public Point(int X, int Y){
    default_color[0] = 0;
    default_color[1] = 0;
    default_color[2] = 0;
    select_color[0] = 255;
    select_color[1] = 0;
    select_color[2] = 0;
    click_color[0] = 200;
    click_color[1] = 0;
    click_color[2] = 0;
    x = X;
    y = Y;
  }
  
  public void update(){
    setColor();
    strokeWeight(this.size);
    if(this.clicked()){
      stroke(this.click_color[0], this.click_color[1], this.click_color[2]);
    } else if(collision() && !this.clicked()){
      stroke(this.select_color[0],this.select_color[1],this.select_color[2]);
    } else {
      stroke(this.default_color[0], this.default_color[1], this.default_color[2]);
    }
    point(this.x,this.y);
    strokeWeight(4);
    if(!(mousePressed)){this.collision = true;}
  }
  
  private boolean collision(){
  if((mouseX > x-(size/2) ) && (mouseX < x+(size/2)) && (mouseY > y-(size/2)) && (mouseY < y+(size/2))){
    return true;
  } else {
    
    return false;
    }
  }
  
  private void setColor(){
    default_color[2] = (this.isStop() ? 255 : 0);
    select_color[2] = (this.isStop() ? 255 : 0);
    click_color[2] = (this.isStop() ? 255 : 0);
    default_color[1] = (this.isNode() ? 255 : 0);
    select_color[1] = (this.isNode() ? 255 : 0);
    click_color[1] = (this.isNode() ? 255 : 0);
   //<>//
  }
  
  public boolean isStop(){
  int a = (this.relation[0] ? 1 : 0);
  int b = (this.relation[1] ? 1 : 0);
  int c = (this.relation[2] ? 1 : 0);
  int d = (this.relation[3] ? 1 : 0);
  return (a+b+c+d == 1 ? true : false);
}

  public boolean isLine(){
  int a = (this.relation[0] ? 1 : 0);
  int b = (this.relation[1] ? 1 : 0);
  int c = (this.relation[2] ? 1 : 0);
  int d = (this.relation[3] ? 1 : 0);
  return (a+b+c+d == 2 ? true : false);
}

public boolean isNode(){
  int a = (this.relation[0] ? 1 : 0);
  int b = (this.relation[1] ? 1 : 0);
  int c = (this.relation[2] ? 1 : 0);
  int d = (this.relation[3] ? 1 : 0);
  return (a+b+c+d >= 3 ? true : false);
}
  public boolean clicked(){
   if(collision() && this.collision && mousePressed && mouseButton == LEFT){
    return true; 
   } else {
    return false;
   }
  }
}
