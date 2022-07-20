public class Button{
  public int buttonX = 0;
  public int buttonY = 0;
  public int button_Width = 100;
  public int button_Height = 50;
  public String text = "Foo";
  private int[] default_color = new int[3];
  
  private int[] mouse_color = new int[3];

  private int[] click_color = new int[3];
 
  public int text_Size = 50;

  public Button(String Text, int x, int y, int X, int Y){
    default_color[0] = 200;
    default_color[1] = 200;
    default_color[2] = 200;
    mouse_color[0] = 160;
    mouse_color[1] = 160;
    mouse_color[2] = 160;
    click_color[0] = 120;
    click_color[1] = 120;
    click_color[2] = 120;
    buttonX = x;
    buttonY = y; //<>//
    button_Width = X;
    button_Height = Y;
    text = Text;
  }
 public void update(){ //<>//
    strokeWeight(2);
    stroke(0);
    switch(buttonPress()){
    case 0: fill(default_color[0],default_color[1],default_color[2]); break;
    case 1: fill(mouse_color[0],mouse_color[1],mouse_color[2]); break;
    case 2: fill(click_color[0],click_color[1],click_color[2]); break;
    }
    rect(this.buttonX,this.buttonY,this.button_Width,this.button_Height); //<>//
    fill(0);
    textSize(this.text_Size); //<>//
    textAlign(CENTER,CENTER);
    text(this.text, this.buttonX+(this.button_Width/2), this.buttonY+(this.button_Height/2)); //<>//
  }
  
 public boolean Pressed(){
   if((mouseX > this.buttonX) && (mouseX < this.buttonX+this.button_Width) && (mouseY > this.buttonY) && (mouseY < this.buttonY+this.button_Height)&&(mousePressed && (mouseButton == LEFT))){
   return true;
   } else {
     return false;
   }
 }
  
  private int buttonPress(){
      if((mouseX > this.buttonX) && (mouseX < this.buttonX+150) && (mouseY > this.buttonY) && (mouseY < this.buttonY+80)){
      if(mousePressed && (mouseButton == LEFT)){
        return 2;
      } else {
        return 1;
      }
    } else {
      return 0;
    }
  }
  
  public void default_Color(int g){
  default_color[0] = g;
  default_color[1]= g;
  default_color[2] = g;
  }
  
  public void default_Color(int r, int g, int b){
  default_color[0]= r;
  default_color[1] = g;
  default_color[2] = b;
  }
  
  public void mouse_Color(int g){
   mouse_color[0] = g;
   mouse_color[1] = g;
   mouse_color[2] = g; 
  }
  
  public void mouse_Color(int r, int g, int b){
   mouse_color[0] = r;
   mouse_color[1] = g;
   mouse_color[2] = b; 
  }
  
  public void click_Color(int g){
    click_color[0]= g;
    click_color[1] = g;
    click_color[2] = g; 
  }
  
    public void click_Color(int r, int g, int b){
    click_color[0] = r;
    click_color[1] = g;
    click_color[2] = b; 
  }
}

 
