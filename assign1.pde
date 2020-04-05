PImage bgImg,groundhogImg,lifeImg,robotImg,soilImg,soldierImg;
float grid=80;
float gressH=15;
float lifeW=51;
float groundhogW=80;
float soldierX,soldierY,robotX,robotY;
float soldierW=80;
//int move=0;
//int lx1=25,lx2=25;
float lx1,lx2,laserSpeed1,laserSpeed2;
float laserWeight=40;




void setup() {
	size(640, 480, P2D);
  bgImg=loadImage("img/bg.jpg");
  groundhogImg=loadImage("img/groundhog.png");
  lifeImg=loadImage("img/life.png");
  soilImg=loadImage("img/soil.png");
  //soldierEmerge
  soldierImg=loadImage("img/soldier.png");
  soldierX=-soldierW; //bugSolved#4
  soldierY=(floor(random(0,4))+2)*grid; //bugSolved#1
  //robotEmerge
  robotX=(floor(random(0,6))+2)*grid; //bugSolved#2
  robotY=(floor(random(0,4))+2)*grid; //bugSolved#3
  robotImg=loadImage("img/robot.png");

  laserSpeed2=0;

}

void draw() {
  image(bgImg,0,0);
  image(soilImg,0,grid*2);
  //gress
  fill(124,204,25);
  noStroke();
  rect(0,grid*2-gressH,width,gressH);
  //life
  image(lifeImg,10,10);
	image(lifeImg,lifeW+30,10);
  image(lifeImg,lifeW*2+50,10);
  //groundHog
  image(groundhogImg,width/2-groundhogW/2,grid);
  //sun
  fill(253,184,19);
  stroke(255,255,0);
  strokeWeight(5);
  ellipse(width-50,50,120,120);
  //random
  image(soldierImg,soldierX,soldierY);
  //soldierWalk
  if (soldierX<640+soldierW){
    soldierX++;
  }else{
    soldierX=-soldierW;
  }
  //robot&Laser
  image(robotImg,robotX,robotY);
  lx1=laserSpeed1+robotX+25;
  lx2=laserSpeed2+robotX+25; 
  if (lx1>robotX-grid*2){ //bugSolved#5
    laserSpeed1-=2; //bugSolved#6
    println(lx1,lx2);
    if (lx1<robotX-laserWeight+25){
      laserSpeed2-=2;
    }
  }else{
    laserSpeed1=0;
    laserSpeed2=0;
  }
  stroke(255,0,0);
  strokeWeight(10);
  line(lx1,37+robotY,lx2,37+robotY);
}
