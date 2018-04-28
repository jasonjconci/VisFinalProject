import java.util.*;
import java.lang.*;

Table originalTable;
Table totalsTable;

ArrayList<Float> totalsList;

float X_UNIT, Y_UNIT;

void setup(){
  size(1280,900);
  smooth();
  background(#ffffff);
  surface.setResizable(true);
  originalTable = loadTable("nics-firearm-background-checks.csv", "header");
  totalsTable = loadTable("nics_firearm_background_checks_total_by_month.csv", "header");
  totalsList = new ArrayList<Float>();
  
  for(TableRow row: totalsTable.rows()){
   float total = (float) ((row.getInt("totals")/10000));
   totalsList.add(total);
  }
  Collections.reverse(totalsList);
  X_UNIT =  ((width-20) / totalsList.size());
  Y_UNIT =  ((height-20) / Collections.max(totalsList));
  System.out.println("X:" + X_UNIT + "Y: " + Y_UNIT);
}

void draw(){
  float lastXCoordinate = 10;
  float lastYCoordinate = (height-10);
  float max = Collections.max(totalsList);
  int size = totalsList.size();  
  for(int i = 0; i < size; i++){
    float currX = X_UNIT * (1+i);
    float currY = Y_UNIT * (max - totalsList.get(i));
    
    line(lastXCoordinate, lastYCoordinate, currX, currY);
    
    lastXCoordinate = currX;
    lastYCoordinate = currY;
  }
}
