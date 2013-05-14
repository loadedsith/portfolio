import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class perlinTest extends PApplet {

int ellipse1Height = 25;
int ellipse1Width = 25;
int ellipse1X = 50;
int ellipse1Y = 65;

int ellipse2Height = 25;
int ellipse2Width = 25;
int ellipse2X = 15;
int ellipse2Y = 65;

int ellipse3Height = 25;
int ellipse3Width = 25;
int ellipse3X = 15;
int ellipse3Y = 15;

int shift = 0;
float led1RandomSeedRed = 0.0f;
float led1RandomSeedGreen = 0.0f;
float led1RandomSeedBlue = 0.0f;

float led2RandomSeedRed = 0.0f;
float led2RandomSeedGreen = 0.0f;
float led2RandomSeedBlue = 0.0f;

float led3RandomSeedRed = 0.0f;
float led3RandomSeedGreen = 0.0f;
float led3RandomSeedBlue = 0.0f;
public void draw() {
  int count = 0;
  int centerX=50;
  int centerY=50;
  int radius = 30;
  
  background(100,100,100);
  for(float ang = 0; ang<360; ang += 120) {
    float rad = radians(ang+shift);
    float x = centerX + (radius * cos(rad));
    float y = centerY + (radius * sin(rad));
    
    led1RandomSeedRed += random(.005f)-.002f;
    led1RandomSeedGreen += random(.005f)-.002f;
    led1RandomSeedBlue += random(.005f)-.002f;

    led2RandomSeedRed += random(.005f)-.002f;
    led2RandomSeedGreen += random(.005f)-.002f;
    led2RandomSeedBlue += random(.005f)-.002f;

    led3RandomSeedRed += random(.005f)-.002f;
    led3RandomSeedGreen += random(.005f)-.002f;
    led3RandomSeedBlue += random(.005f)-.002f;

    print("seed: "+led1RandomSeedRed+"\n");
    print(x+"\n");
    switch(count) {
    case 0:
    fill((int)(noise(led1RandomSeedRed)*255),(int)(noise(led1RandomSeedGreen)*255),(int)(noise(led1RandomSeedBlue)*255));
      ellipse(x, y, ellipse1Width, ellipse1Height);
      break;
    case 1:
    fill((int)(noise(led2RandomSeedRed)*255),(int)(noise(led2RandomSeedGreen)*255),(int)(noise(led2RandomSeedBlue)*255));
      ellipse(x, y, ellipse2Width, ellipse2Height);
      break;
    case 2:
    fill((int)(noise(led3RandomSeedRed)*255),(int)(noise(led3RandomSeedGreen)*255),(int)(noise(led3RandomSeedBlue)*255));
      ellipse(x, y, ellipse3Width, ellipse3Height);
      break;
    }
    if(count >2) {
      count=0;
    }
    else {
      count++;
    }
  }
    if(shift>360) {
      shift=0;
    }
    else {
      shift++;
    }
  
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "perlinTest" });
  }
}
