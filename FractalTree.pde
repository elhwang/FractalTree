private double fractionLength = 0.8; 
private int smallestBranch = 5; 
private double branchAngle = 0.35;  
public void setup() 
{   
  size(640,480); 
  frameRate(4);
  
} 
public void draw() 
{   
  background(#B8E3FA);
    for(int i = 0; i <= 700; i+=77){
    stroke(-0.5);
    fill(255);
    rect(i,370,25,340);
  }
  rect(0,390,700,25);
  fill(#FCF18C);
  stroke(#FFF6A2);
  ellipse(640,0,200,200);
  strokeWeight(40);
  stroke(#6F3939);
  line(320,480,320,380);   
  drawBranches(320,380,100,3*Math.PI/2,50);
} 
public void drawBranches(int x,int y, double branchLength, double angle, double thicc) 
{   
 branchLength *= fractionLength;
 thicc *= 0.86;
 if(branchLength < smallestBranch){
  strokeWeight((int)thicc);
 double angle1 = angle + branchAngle;
 double angle2 = angle - branchAngle;
 int endX1 = (int)(branchLength*Math.cos(angle1)+x);
 int endY1 = (int)(branchLength*Math.sin(angle1)+y);
 int endX2 = (int)(branchLength*Math.cos(angle2)+x);
 int endY2 = (int)(branchLength*Math.sin(angle2)+y);
 line(x,y,endX1,endY1);
 line(x,y,endX2,endY2);
 }
 else{
 if(branchLength > 20){
 stroke(#6F3939);
 }
 else{
   int random = (int)(Math.random()*3);
   if(random == 0)
   stroke(#2F7E29); 
   if(random == 1)
   stroke(#76D12C);
   if(random == 2)
   stroke(#23CB15);
 }
 thicc *= 0.83;
 strokeWeight((int)thicc);
 double angle1 = angle + branchAngle;
 double angle2 = angle - branchAngle;
 int randumb = (int)(Math.random()*3);
 if(randumb == 0){
 angle2 -= 0.01;
 angle1 += 0.01;
 }
 if(randumb == 1){
 angle2 += 0.01;
 angle1 -= 0.01;
 }
 int endX1 = (int)(branchLength*Math.cos(angle1)+x);
 int endY1 = (int)(branchLength*Math.sin(angle1)+y);
 int endX2 = (int)(branchLength*Math.cos(angle2)+x);
 int endY2 = (int)(branchLength*Math.sin(angle2)+y);
 line(x,y,endX1,endY1);
 line(x,y,endX2,endY2);
 drawBranches(endX1,endY1,branchLength,angle1,thicc);
 drawBranches(endX2,endY2,branchLength,angle2,thicc);
} 
}
