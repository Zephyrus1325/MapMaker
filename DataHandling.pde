public void export_data(){
  ArrayList<String> data = new ArrayList<String>();
  println("x" + pointX + "y" + pointY);
  data.add(new String(pointX + "|" + + pointY + "|"));
  for(int i = 0; i < points.size(); i++){
    Point reference = points.get(i);
    boolean buf1 = reference.relation[0];
    boolean buf2 = reference.relation[1];
    boolean buf3 = reference.relation[2];
    boolean buf4 = reference.relation[3];
    if((buf1 || buf2 || buf3 || buf4)){
      //print(i + ":");
      char a = ((buf1 == true) ? '1' : '0');
      char b = ((buf2 == true) ? '1' : '0');
      char c = ((buf3 == true) ? '1' : '0');
      char d = ((buf4 == true) ? '1' : '0');
      //if(buf1 == true){print("1");} else {print("0");}
      //if(buf2 == true){print("1");} else {print("0");}
      //if(buf3 == true){print("1");} else {print("0");}
      //if(buf4 == true){print("1");} else {print("0");}
      //println(";");
      data.add(i + "|" + a + "|" + b + "|" + c + "|" + d + "|");
    }
    
  }
  String s = data.get(0);
  String[] out = new String[data.size()];
  out[0] = s;
  for(int i = 1; i < data.size(); i++){
    String ref = data.get(i);
    out[i] =  ref;
    println(ref);
  }
  
  saveStrings("output.txt", out);
}


public void import_data(){
  Clear();
  slidX.value = pointX;
  slidY.value = pointY;
  String[] imp = loadStrings("output.txt");
  int[] foo =  int(split(imp[0], "|"));
  pointX = foo[0];
  pointY = foo[1]; //<>//
  for(int i = 1; i < imp.length; i++){
    int[] line = int(split(imp[i], "|"));    //<>//
    loadPoint(i, line);
  }
}

public void loadPoint(int i, int[] line){
  Point ref = points.get(line[0]);
  for(int j = 1; j < 5; j++){
    ref.relation[j-1] = boolean(line[j]);
  }
}
