int ellipse1Height = 35;
int ellipse1Width = 35;
int ellipse1X = 50;
int ellipse1Y = 65;

int ellipse2Height = 35;
int ellipse2Width = 35;
int ellipse2X = 15;
int ellipse2Y = 65;

int ellipse3Height = 35;
int ellipse3Width = 35;
int ellipse3X = 15;
int ellipse3Y = 15;

int shift = 0;
float led1RandomSeedRed = random(6.5);
float led1RandomSeedGreen = random(6.5);
float led1RandomSeedBlue = random(6.5);

float led2RandomSeedRed = random(6.5);
float led2RandomSeedGreen = random(6.5);
float led2RandomSeedBlue = random(6.5);

float led3RandomSeedRed = random(6.5);
float led3RandomSeedGreen = random(6.5);
float led3RandomSeedBlue = random(6.5);
void draw() {
  
  stroke(0,0,0,0);
  ///background(255);
  int count = 0;
  int centerX=50;
  int centerY=50;
  int radius = 30;
  
  for(float ang = 0; ang<360; ang += 120) {
    float rad = radians(ang+shift);
    float x = centerX + (radius * cos(rad));
    float y = centerY + (radius * sin(rad));
    
    led1RandomSeedRed += random(.005)-.002;
    led1RandomSeedGreen += random(.005)-.002;
    led1RandomSeedBlue += random(.005)-.002;

    led2RandomSeedRed += random(.005)-.002;
    led2RandomSeedGreen += random(.005)-.002;
    led2RandomSeedBlue += random(.005)-.002;

    led3RandomSeedRed += random(.005)-.002;
    led3RandomSeedGreen += random(.005)-.002;
    led3RandomSeedBlue += random(.005)-.002;

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

