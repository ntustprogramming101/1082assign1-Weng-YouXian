int lifeW=51;
int groundhogW=80;
int soldierX,soldierY,robotX,robotY;
int soldierW=80;
int move=0;

void setup() {
	size(640, 480, P2D);
  bgImg=loadImage("bg.jpg");
  groundhogImg=loadImage("groundhog.png");
  lifeImg=loadImage("life.png");
  robotImg=loadImage("robot.png");
  soilImg=loadImage("soil.png");
  //soldierEmerge
  soldierImg=loadImage("soldier.png");
  soldierX=floor(random(0,640));
  soldierY=(floor(random(1,4))+2)*grid;
  //robotEmerge
  robotX=(floor(random(0,5))+2)*grid;
  robotY=(floor(random(1,4))+2)*grid;
  robotImg=loadImage("robot.png");
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
  if (move>-(grid*2+25)){
    move--;
  }else{
    move=0;
  }
  stroke(255,0,0);
  strokeWeight(10);
  line(25+robotX+move,37+robotY,35+robotX+move,37+robotY);
  image(robotImg,robotX,robotY);
}
