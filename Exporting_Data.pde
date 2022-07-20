public void export_data(){
  println("x" + pointX + "y" + pointY);
  for(int i = 0; i < points.size(); i++){
    Point reference = points.get(i);
    boolean buf1 = reference.relation[0];
    boolean buf2 = reference.relation[1];
    boolean buf3 = reference.relation[2];
    boolean buf4 = reference.relation[3];
    if((buf1 || buf2 || buf3 || buf4)){
      print(i + ":");
      if(buf1 == true){print("1");} else {print("0");}
      if(buf2 == true){print("1");} else {print("0");}
      if(buf3 == true){print("1");} else {print("0");}
      if(buf4 == true){print("1");} else {print("0");}
      print(";");
      //println(";");
      //comment code below for real use
      if((buf1 && !buf2 && !buf3 && !buf4)){ print("stop");}
      if((!buf1 && buf2 && !buf3 && !buf4)){ print("stop");}
      if((!buf1 && !buf2 && buf3 && !buf4)){ print("stop");}
      if((!buf1 && !buf2 && !buf3 && buf4)){ print("stop");}
      println(" ");
    }
    
  }
}
