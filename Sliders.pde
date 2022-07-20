public class Slider{
  public int x = 0;
  public int y = 0;
  public int width = 100;
  public int height = 50;
  private int[] background = new int[3];
  private int[] foreground = new int[3];
  private int[] Color = new int[3];
  public int min = 0;
  public int max = 100;
  public float value;
  private int carlos;
  public int slider_Width = 10;
  public boolean floor = false;
  public Slider(int x, int y, int X, int Y){
   background[0] = 120;
   background[1] = 120;
   background[2] = 120;
   foreground[0] = 64;
   foreground[1] = 64;
   foreground[2] = 64;
   Color[0] = 255;
   Color[1] = 0;
   Color[2] = 0;
   this.x = x;
   this.y = y;
   this.width = X;
   this.height = Y;
   carlos = (this.height>>3); //this.height/8
  }
  
  public void update(){
    collision();
    visual();
    value = constrain(value,this.min, this.max);
  }
  
  private void visual(){
    fill(background[0],background[1],background[2]);
    rect(this.x,this.y, this.width, this.height);
    fill(foreground[0],foreground[1],foreground[2]);
    rect(this.x+carlos, this.y+carlos, this.width-(2*carlos), this.height-(2*carlos));
    fill(Color[0], Color[1], Color[2]);
    rectMode(CENTER);
    rect(map(this.value,this.min,this.max,this.x+carlos+(slider_Width/2),this.x+width-carlos-(slider_Width/2)),(this.y+(this.height/2)),this.slider_Width,this.height-(2*carlos));
    rectMode(CORNER);
  }
  
  private void collision(){
    if((mouseX > this.x + carlos) && (mouseX < this.x + this.width - carlos) && (mouseY > this.y + carlos) && (mouseY < this.y + this.height - carlos)){
      if(mousePressed && (mouseButton == LEFT)){
        if(this.floor){
          value = floor(constrain(map(mouseX,this.x+carlos+(this.slider_Width/2), this.x+this.width-carlos-(this.slider_Width/2),this.min, this.max),this.min, this.max));
        } else {
          value = constrain(map(mouseX,this.x+carlos+(this.slider_Width/2), this.x+this.width-carlos-(this.slider_Width/2),this.min, this.max),this.min, this.max);
        }      
      }
    }
  }
}
