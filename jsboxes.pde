int starCount=0;
ArrayList stars;


void setup() {
  size(800, 150, OPENGL);

  
  //A 3D object for our workspace, 
  //the height and width of the background image

  //turn on the default lights
  frameRate(30);
  //allows for smooth predictable animation, 
  //not dependent on the speed of the processor
  smooth();
  //antialiasing probably, looks nice
  //load the background image, 604px*403px


  background(0,0,0,0);
  //make the image the background (it would be a default color otherwise
  stars = new ArrayList();
  //an arry of objects, with some default actions thanks to ArrayLists
}

void draw() { 
  //this essentially redoes setup() again, however
  //doing this every draw() removes trails

  background(0,0,0,0);
  //Apply the background image, 
  lights();
  //load the default lights
  //ambientLight(102, 102, 102);
  for (int i = stars.size()-1; i >= 0 ; i--) {
    fallingStar star = (fallingStar) stars.get(i);
    star.update();
  }
  //if(mouseX<=width&&mouseY<=height&&mouseX>=0&&mouseY>=0){
  //stars.add(new fallingStar(mouseX, mouseY));
  //}

  if (mousePressed) {
    stars.add(new fallingStar(mouseX, mouseY));
    //create an object at the mouse's possition
  }
  else {
    if(frameCount%5==0){
      stars.add(new fallingStar(int(random(width-50)), -50));
    }
    //create an object at a random possition
  }
  
}
class fallingStar
{
  //declair stuff every objects gonna need
  float x;
  float y;
  float z;
  float xRot;
  float yRot;
  float zRot;
  int myX;
  int myY;
  int myRed;
  int myGreen;
  int myBlue;
  int myDecay;
  float mySize;
  int alphaDelay;
  int starType;
  fallingStar() {
    //
    x=mouseX;
    y=mouseY;
    mySize=1+int(random(10));
    fill(0);
    noStroke();
    myDecay=300+(15*int(random(5)));
    starType=int(randomStarType());
    //println("I'm a falling star named "+this);
    //println("coordinates: "+myX+", "+myY);
    //println("decay: "+myDecay+" /  Size:"+mySize+" Type:"+starType);
   // println("There are "+stars.size()+" stars");
  }

  fallingStar(int myX, int myY) {
    mySize=random(10)+3;
    int xOffset=int( 3*(random(mySize) - .5 * mySize));
    x=myX +xOffset;
    y=myY;

    z=random(10)-7.5;
    xRot = random(1)-.5;
    yRot = random(1)-.5;
    zRot = random(1)-.5;
    fill(0);
    noStroke();
    starType=int(randomStarType());
    myDecay=30+(15*int(random(10)));
    //println("I'm a falling star named "+this);
  //  println("coordinates: "+myX+", "+myY);
   // println("decay: "+myDecay+" /  Size:"+mySize);
 //   println("There are "+stars.size()+" stars");
  }

  void update() {
    //giggle();
    gravity();
    fade();
    decay();

    fill(30,30,30,myDecay);
    stroke(120,120,120,myDecay+5);
    //ellipse(x,y,mySize*2,mySize*2);
    drawMyStars(int(x),int(y),int(mySize*2),int(mySize*2),starType);
    //    println("I'm a falling star named "+this+" located: x:"+x+" y:"+y+".");
    //    println("It Should be colored: "+myDecay);
    //    println("It Should be delayed: "+alphaDelay);
  }
  void giggle() {
    x = x + (random(.5)-.25);
    y = y + (random(1)-.5);
  }
  void gravity() {
    y = y + 1+.08*mySize;
  }
  void fade() {
    if(myDecay>=0) {
      myDecay=myDecay-1;
    }
	if(myY>height-50){
		myDecay=0;
	}
  }
  void decay() {
    if(myDecay<=0) {
      //println("Removing "+this+".\n"+"There were: "+stars.size()+" stars.");
      stars.remove(this);
      //print(" There are now: "+stars.size()+" stars\n");
    }
  }
  // Custom method for drawing the object
  void draw() {
  }
  int randomStarType() {
    //Might seem small now, but have plans for this function
    return int(random(3));
  }
  void drawMyStars(int x,int y, int myWidth, int myHeight, int starType) {
    starType=3;
    switch(starType) {
    case 0:
      beginShape();
      vertex(.5*myHeight+x-.5*myHeight, 0+y-.5*myHeight);
      vertex(.15*myHeight+x-.5*myHeight, .9*myHeight+y-.5*myHeight);
      vertex(myHeight+x-.5*myHeight,.33*myWidth+y-.5*myHeight);
      vertex(0+x-.5*myHeight,.33*myWidth+y-.5*myHeight);
      vertex(.85*myHeight+x-.5*myHeight,.9*myWidth+y-.5*myHeight);
      endShape(CLOSE);
      break;

    case 1:
      beginShape();
      vertex(.5*myHeight+x, 0+y);
      vertex(.15*myHeight+x, .9*myHeight+y);
      vertex(myHeight+x,.33*myWidth+y);
      vertex(0+x,.33*myWidth+y);
      vertex(.85*myHeight+x,.9*myWidth+y);
      endShape(CLOSE);
      break; 

    case 2:

      pushMatrix();
      translate(x,y,0);
      box(myHeight,myWidth,myHeight);
      popMatrix();
      break;
    case 3:
      pushMatrix();
      translate(x,y,0);
      xRot += (myDecay/25)/xRot;
      yRot += (myDecay/25)/yRot;
      zRot += (myDecay/25)/zRot;
      rotateX(xRot);
      rotateY(yRot);
      rotateZ(zRot);

      box(myHeight,myWidth,myHeight);
      popMatrix();
      break;
    default:
      //println("error; Star Type Falling Back To Default.  Mine is:"+starType);
      break;
    }
  };
}

