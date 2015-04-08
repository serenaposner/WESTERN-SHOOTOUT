
/*
Processing sketch to run game WESTERN SHOOTOUT: Are You a good Cop 
or a Bad Cop
Serena Posner
DIGF 2B03 Physical Computing
OCAD University
Created on 040815
*/ 

import processing.serial.*;
import org.firmata.*;
import cc.arduino.*;
import ddf.minim.*;
import gifAnimation.*;


Minim m;
AudioPlayer cntdwn, west;

Arduino arduino;


PImage town;
PImage opo1;
PImage opo11;
PImage opo1X;
PImage opo2;
PImage opo22;
PImage opo2X;
PImage opo3;
PImage opo33;
PImage opo3X;
PImage opo4;
PImage opo44;
PImage opo4X;
PImage opo5;
PImage opo55;
PImage opo5X;
PImage intro;
PImage badge;
PImage b1;
PImage bB1;
PImage go;
PImage instructtext;
PImage dash;
PImage youlose;
PImage youlosetext;

Serial myPort;
String val="5";


int ONEescape=0;
int ONEgot=0;
int TWOescape=0;
int THREEescape=0;
int FOURescape=0;
int FIVEescape=0;
int counter=0;
float yesorno;
float fromVal=1;

int startmusic=0;
int roundcounter=1;

int goodcop=0;
int badcop=0;



void setup() {
  String portName = Serial.list()[4];
  myPort = new Serial (this, portName, 9600);
  
  size(1500,900);
  town = loadImage("town.jpg");
  opo1 = loadImage("Opo1.png");
  intro = loadImage("intro.png");
  badge = loadImage("badge.png");
  b1 = loadImage("b1.png");
  bB1 = loadImage("bB1.png");
  opo11 = loadImage ("Opo1shoot.png");
  go = loadImage ("Go.png");
  instructtext = loadImage ("instructtext.png");
  opo1X = loadImage ("Opo1X.png");
  opo2 = loadImage("Opo2.png");
  opo22 = loadImage("Opo22.png");
  opo2X = loadImage("Opo2X.png");
  opo3 = loadImage("Opo3.png");
  opo33 = loadImage("Opo33.png");
  opo3X = loadImage("Opo3X.png");
  opo4 = loadImage("Opo4.png");
  opo44 = loadImage("Opo44.png");
  opo4X = loadImage("Opo4X.png");
  opo5 = loadImage("Opo5.png");
  opo55 = loadImage("Opo55.png");
  opo5X = loadImage("Opo5X.png");
 dash = loadImage ("dash.png");
 youlose = loadImage ("youlose.jpg");
 youlosetext= loadImage ("youlosetext.png");
 image(town,0,0,1450,900);
 float counter;
 m = new Minim(this);
 cntdwn = m.loadFile("54321.mp3");
 west  = m.loadFile ("west.mp3");
 
}



void draw() {
  
  if (ONEescape==3){
    counter=119;
  }
  
  if (mousePressed == true && roundcounter==6){
    delay(1000);
    countdown();
    if (badcop>goodcop){
        image(town,0,0,1450,900);
        image(bB1, 500,200);
        counter=0;
    }
     if (badcop<goodcop){
        image(town,0,0,1450,900);
        image(b1, 500,200);
        counter=0;
    }
     if (badcop==goodcop){
        image(town,0,0,1450,900);
        image(badge, 500,200);
        counter=0;
    }
    countdown();
  }
      
    
  
  if (mousePressed == true && startmusic==0){
  startmusic++;
  west.play(3);
  }
  
   if ( myPort.available() > 0) 
  val = myPort.readStringUntil('\n');         // read it and store it in val

 
 if (mousePressed == true | counter==119 | counter==6){
   
   delay(1000);
   counter++;
   println("counter="+counter);
  
   
   
   
   if(counter==1){
   image(town,0,0,1450,900);
   image(intro, 100,100);
   delay(500);
   }
   
   if (counter==2){
   println("IN NUMBER 2");
   yesorno= random(5);
   println(yesorno); 
   
   image(town,0,0,1450,900);
   
   if (roundcounter==1)//images progress by round to next OPO
   image(opo1, 500, 200);//
   if (roundcounter==2)//
   image(opo2, 300, 300,200,300);//
   if (roundcounter==3)//
   image(opo3,700,400,450,450);//
   if (roundcounter==4)//
   image(opo4, 250,450,450,450);//
   if (roundcounter==5)//
   image(opo5, 500,200,650,650);//
   
   if (roundcounter==1)
   image(instructtext, 175, 700);
   }
   
if (counter==3){
   image(town,0,0,1450,900);
   if (roundcounter==1)//images progress by round to next OPO
   image(opo1, 500, 200);//
   if (roundcounter==2)//
   image(opo2, 300, 300,200,300);//
   if (roundcounter==3)//
   image(opo3, 700,400,450,450);//
   if (roundcounter==4)//
   image(opo4, 750,450,450,450);//
   if (roundcounter==5)//
   image(opo5, 500,200,400,400);//
   
   println("countdown");
   countdown();
   cntdwn.rewind();
   cntdwn.play();
   println("54321 playing");
   println("countdownfast");
   countdownfast();
   counter++;
  } 
  

  if (counter==4){
    countdown();
    
          if ( myPort.available() > 0) 
          val = myPort.readStringUntil('\n');         // read it and store it in val

  fromVal = Float.parseFloat(val);
  if (roundcounter==1)//images progress by round to next OPO
  image(opo1, 500, 200);//
  if (roundcounter==2)//
  image(opo2, 300, 300,200,300);//
  if (roundcounter==3)//
   image(opo3, 700,400,450,450);//
   if (roundcounter==4)//
   image(opo4, 750,450,450,450);//
   if (roundcounter==5)//
   image(opo5, 500,200,400,400);//
  
  if (yesorno > 2.5){//if dangerous, skip to shoot
    counter++;
  }
  println("VAL" + val + " VAL INT " + fromVal);
   if (counter==4 && fromVal>=950 & fromVal!=5000.00){//if peacefulOPO and surrender  
 //removed countdown here
   if (roundcounter==1)//images progress by round to next OPO
   image(opo1X, 500, 200);//
   if (roundcounter==2)//
   image(opo2X, 300, 300,200,300);//
   if (roundcounter==3)//
   image(opo3X, 700,400,450,450);//
    if (roundcounter==4)//
   image(opo4X, 750,450,450,450);//
   if (roundcounter==5)//
   image(opo5X, 500,200,400,400);//
    
    println("peaceful surrender");
    countdownfast();
    ONEgot=1;
    counter=1;
    roundcounter++;
    goodcop++;
  }
  if (counter==4 && fromVal <900 && yesorno <= 2.5){ //if dont shoot and dont surrender
    countdown();
    println ("he ran AWAY!");
    image(town,0,0,1450,900);
    image(dash, 525, 325);
    println("countdownfast");
    countdownfast();
    println("he ran away");
    println("VAL" + val + " VAL INT " + fromVal + " Evilness "+ yesorno);
    ONEescape++;
    counter=1;
    roundcounter++;
    
  }
  
   if (counter==4 && fromVal==5000.0 && yesorno <= 2.5){//if peaceful and shoot
   image(town,0,0,1450,900);
   
   if (roundcounter==1)//images progress by round to next OPO
   image(opo1X, 500, 200);//
   if (roundcounter==2)//
   image(opo2X, 300, 300,200,300);//
   if (roundcounter==3)//
   image(opo3X, 700,400,450,450);//
   if (roundcounter==4)//
   image(opo4X, 750,450,450,450);//
   if (roundcounter==5)//
   image(opo5X, 500,200,400,400);//
   
   //removed countdownfast
   countdownfast();
   println("countdownfast X2");
   println("shot a peacemaker");
   badcop++;
   //removed countdown
   
   if (roundcounter==1)//images progress by round to next OPO
   image(opo1X, 500, 200);//
   if (roundcounter==2)//
   image(opo2X, 300,300, 200,300);//
   if (roundcounter==3)//
   image(opo3X, 700,400,450,450);//
   if (roundcounter==4)//
   image(opo4X, 750,450,450,450);//
   if (roundcounter==5)//
   image(opo5X, 500,200,400,400);//
   
   println("countdownfast");
   countdownfast();
   ONEgot++;
   counter=1;
   roundcounter++;
   
}
  }
     
     
   if (counter==5){//dangerous, shoot option OPO1
   println ("counter="+counter);
   println("fromVal="+fromVal);
   if (counter==5 && fromVal!=5000.00){
   image(town,0,0,1450,900);
   
    if (roundcounter==1)//images progress by round to next OPO
   image(opo11, 500, 200);//
   if (roundcounter==2)//
   image(opo22, 300,300, 200,300);//
   if (roundcounter==3)//
   image(opo33, 700,400,450,450);//
   if (roundcounter==4)//
   image(opo44, 750,450,450,450);//
    if (roundcounter==5)//
   image(opo55, 500,200,400,400);//
   
   counter=100;
   countdown();
   
   }
   if (counter==5 && fromVal==5000.0){
   println("countdownfast");
   countdownfast();
   counter++;
   }
   }
   
   if (counter==6){
   if (fromVal==5000){
     //remove countdownfast
   image(town,0,0,1450,900);
   
   if (roundcounter==1)//images progress by round to next OPO
   image(opo1X, 500, 200);//
   if (roundcounter==2)//
   image(opo2X, 300,300,200,300);//
   if (roundcounter==3)//
   image(opo3X, 700,400,450,450);//
   if (roundcounter==4)//
   image(opo4X, 750,450,450,450);//
   if (roundcounter==5)//
   image(opo5X, 500,200,400,400);//
   
   println("shot a villain");
    countdown();
    ONEgot=1;
    counter=1;
    roundcounter++;
   }
   else
   {
     counter=100;//sends to LOSE screen
   }
   }
     
   
   if (counter==100){//OPO1 LOSE screen
   image(town,0,0,1450,900);
   
    if (roundcounter==1)//images progress by round to next OPO
   image(opo11, 500, 200);//
   if (roundcounter==2)//
   image(opo22, 300,300,200,300);//
   if (roundcounter==3)//
   image(opo33, 700,400,450,450);//
   if (roundcounter==4)//
   image(opo44, 750,450,450,450);//
   if (roundcounter==5)//
   image(opo55, 500,200,400,400);//
   
   counter=119;
   println("countdown");
   countdownfast();
   }
   
   
   if (counter==120){//LOSE SCREEN
   image(youlose,0,0,1450,900);
   image(youlosetext,400,600);
     counter=0;
   }
   
   }
 
}

   
   
   void countdown(){

     for (int goingdown=100; goingdown>0;goingdown--){
       delay(50);
          if ( myPort.available() > 0) 
          val = myPort.readStringUntil('\n');  
       //println (goingdown);
 
     }
 
 
   }
   
   void countdownfast(){

     for (int goingdown=50; goingdown>0;goingdown--){
       delay(10);
       //println (goingdown);
 
     }
 
 
   }
   
  
   
void stop()
{
  west.close();
  cntdwn.close();
  m.stop();
  super.stop();
}




