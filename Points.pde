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
  }
  
  private boolean collision(){
  if((mouseX > x-(size/2) ) && (mouseX < x+(size/2)) && (mouseY > y-(size/2)) && (mouseY < y+(size/2))){
    return true;
  } else {
    this.collision = true;
    return false;
    }
  }
  public boolean clicked(){
   if(collision() && this.collision && mousePressed && mouseButton == LEFT){
    return true; 
   } else {
    return false;
   }
  }
}
