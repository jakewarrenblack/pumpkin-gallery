//Processing was having difficulty playing the music, I had to increase its memory allocation to 1000MB.

//Import sound library
// This must be imported into the processing client
import processing.sound.*;

////Variable for my music
SoundFile soundfile;
Sound s;

//Create instances of the Pumpkin object
Pumpkin pumpkin1;
Pumpkin pumpkin2;
Pumpkin pumpkin3;
Pumpkin pumpkin4;
Pumpkin pumpkin5;
Pumpkin pumpkin6;
Pumpkin pumpkin7;
Pumpkin pumpkin8;
Pumpkin pumpkin9;
Pumpkin pumpkin10;
Pumpkin pumpkin11;
Pumpkin pumpkin12;

ArrayList<Pumpkin> pumpkins = new ArrayList<Pumpkin>();



int ellipsePos;

boolean mouseClick;

int gain = 0;

//States
int state = 1;

//Used to determine which pumpkin the user has selected. State becomes 2 and pumpkin.display() is then run for that pumpkin.
int pumpkinChoice = 0;

//Declare variable for font import.
PFont font;

//Image array
PImage images[] = new PImage[12];

//
int xPos = 12;
int xPos2 = 12;
int xPos3 = 12;

void setup() {
  size(800, 800);
  frameRate(30);
  noStroke();
  font = createFont("Montserrat-Regular.ttf", 32);
  textFont(font);
  pumpkin1 = new Pumpkin();
  pumpkin2 = new Pumpkin(loadImage("1.jpg"), "Alantic Giant", "This is the really big one, regularly producing monsters up to and over 300kg. If you want to win the local pumpkin growing competition or just grow a huge one for halloween then this is the one to grow. ", "Large", "Competition");
  pumpkin3 = new Pumpkin(loadImage("2.jpg"), "Fairytale", "The fairytale pumpkin is an heirloom French variety called “Musquee de Provence,” and gets its nickname from its fanciful appearance. Somewhat flat and deeply ribbed, this richly-colored squash looks exactly like those depicted in the fairy tales you remember from childhood. ", "Medium", "Cooking" );
  pumpkin4 = new Pumpkin(loadImage("3.jpg"), "Baby Boo", "White pumpkin can be substituted for orange pumpkin in many recipes, whether you're baking white pumpkin pie or concocting a pumpkin soup. The satiny texture and sweet pumpkin taste of the Lumina variety is excellent for baking.", "Medium", "Decoration");
  pumpkin5 = new Pumpkin(loadImage("4.jpg"), "Cheese Pumpkin", "Long Island Cheese squash is medium to large in size, averaging 6-10 pounds in weight, and is round, squat, and semi-flattened in shape. When cooked, Long Island Cheese squash is tender and creamy with a mild, sweet, and earthy flavor.", "Medium", "Cooking");
  pumpkin6 = new Pumpkin(loadImage("5.jpg"), "Porcelain Doll", "Porcelain Doll squash is medium to large in size, averaging 16-24 pounds, and is globular, blocky, and has a shallow, sunken in stem cap. When cooked, Porcelain Doll squash is tender with a smooth texture and a sweet flavor. ", "Small", "Cooking");
  pumpkin7 = new Pumpkin(loadImage("6.jpg"), "Vif d'Etampes", "This French heirloom produces beautiful deep red, flat pumpkins with deep ridges that are the first to colour in the pumpkin patch. Sow Rouge Vif d’Etampes pumpkin seeds for a sprawling plant that produces two to four lovely 9kg (20lb) fruits", "Medium", "Decoration");
  pumpkin8 = new Pumpkin(loadImage("7.jpg"), "Kabocha", "Meet kabocha squash, a Japanese staple ingredient that’s prized for its sweet taste, velvety texture, slew of health benefits, and versatility. If you love pumpkin and sweet potato, then kabocha will quickly become your new best friend this fall. ", "Small", "Cooking");
  pumpkin9 = new Pumpkin(loadImage("8.jpg"), "Gargoyle", "Before you blame a virus for your bumpy pumpkins, check the variety. Certain varieties are grown specifically for their naturally occurring bumps. These include Gargoyle pie pumpkins, Knucklehead and Goosebumps. These are too watery for cooking. Just for decoration!", "Large", "Decoration");
  pumpkin10 = new Pumpkin(loadImage("9.jpg"), "Autumn Gold", "Autumn Gold Pumpkins have a deep orange rind, with slight ribbing. The skin colour develops before the pumpkin is fully ripe, making it good as an ornamental in areas that have early frost.", "Medium", "Cooking");
  pumpkin11 = new Pumpkin(loadImage("10.jpg"), "Turban Pumpkin", "Turban squash, also known as Turk's turban or French turban (Giraumon in French), is a type of squash most often used as a winter squash. It is an heirloom, predating 1820.", "Medium", "Cooking");
  pumpkin12 = new Pumpkin(loadImage("11.jpg"), "Tiger Pumpkin", "Mini Tiger pumpkins are small in size, averaging 7-12 centimeters in diameter, and are round, squat, and slightly flattened in shape. Mini Tiger pumpkins are tender and smooth with a sweet and slightly nutty taste.", "Small", "Cooking");

  //Loop through the array running loadImage for every index
  for (int i=0; i<images.length; i++) {
    images[i] = loadImage(i+".jpg");
  }

  //Create new sound file and a variable to control the global volume.
  soundfile = new SoundFile(this, "samba.mp3");
  s = new Sound(this);
  soundfile.loop();

  //Set the slider position to the middle to begin with.
  ellipsePos = width/2;
}


void draw() {
  //Default state is 1, the menu page.
  if (state == 1) {
    mouseClick = true;
    drawImages();

    //State 2 is the info page.
  } else if (state == 2) {
    //If state is 2, I don't want the mouseclick function running because the hitboxes would then be clickable on the info page
    mouseClick = false;
    infoPage();
    //State 3 is the settings page.
  } else if (state == 3) {
    mouseClick = false;
    settingsPage();
    mouseDragged();
  }
}

void mousePressed() {

  //Checking mouse position when a pumpkin is clicked. Then we'll set the pumpkin choice and change the state to 2.

  if (mousePressed && mouseClick && mouseX >= 12 && mouseX <= width/4-25+12 && mouseY >= height/2-height/4-25 && mouseY <= height/4-25+height/2-height/4-25) {
    //println("hitbox1");
    pumpkinChoice = 1;
    println();
    println("Pumpkin choice: " +pumpkinChoice);
    state = 2;
  } else if (mousePressed && mouseClick && mouseX >= 12+width/4 && mouseX <= width/4-25+12+width/4 && mouseY >= height/2-height/4-25 && mouseY <= height/4-25+height/2-height/4-25) {
    //println("hitbox2");
    println();
    pumpkinChoice = 2;
    println("Pumpkin choice: " +pumpkinChoice);
    state = 2;
  } else if (mousePressed && mouseClick && mouseX >= 12+width/4*2 && mouseX <= width/4-25+12+width/4*2 && mouseY >= height/2-height/4-25 && mouseY <= height/4-25+height/2-height/4-25) {
    //println("hitbox3");
    println();
    pumpkinChoice = 3;
    println("Pumpkin choice: " +pumpkinChoice);

    state = 2;
  } else if (mousePressed && mouseClick && mouseX >= 12+width/4*3 && mouseX <= width/4-25+12+width/4*3 && mouseY >= height/2-height/4-25 && mouseY <= height/4-25+height/2-height/4-25) {
    // println("hitbox4");
    println();
    pumpkinChoice = 4;
    println("Pumpkin choice: " +pumpkinChoice);

    state = 2;
  } else if (mousePressed && mouseClick && mouseX >= 12 && mouseX <= width/4-25+12 && mouseY >= height/2-25 && mouseY <= height/4-25+height/2-25) {
    // println("hitbox5");
    println();
    pumpkinChoice = 5;
    println("Pumpkin choice: " +pumpkinChoice);

    state = 2;
  } else if (mousePressed && mouseClick && mouseX >= 12+width/4 && mouseX <= width/4-25+12+width/4 && mouseY >= height/2-25 && mouseY <= height/4-25+height/2-25) {
    //println("hitbox6");
    println();
    pumpkinChoice = 6;
    println("Pumpkin choice: " +pumpkinChoice);

    state = 2;
  } else if (mousePressed && mouseClick && mouseX >= 12+width/4*2 && mouseX <= width/4-25+12+width/4*2 && mouseY >= height/2-25 && mouseY <= height/4-25+height/2-25) {
    // println("hitbox7");
    println();
    pumpkinChoice = 7;
    println("Pumpkin choice: " +pumpkinChoice);

    state = 2;
  } else if (mousePressed && mouseClick && mouseX >= 12+width/4*3 && mouseX <= width/4-25+12+width/4*3 && mouseY >= height/2-25 && mouseY <= height/4-25+height/2-25) {
    //println("hitbox8");
    println();
    pumpkinChoice = 8;
    println("Pumpkin choice: " +pumpkinChoice);

    state = 2;
  } else if (mousePressed && mouseClick && mouseX >= 12 && mouseX <= width/4-25+12 && mouseY >= height-(height/4+25) && mouseY <= height/4-25+height-(height/4+25)) {
    //println("hitbox9");
    println();
    pumpkinChoice = 9;
    println("Pumpkin choice: " +pumpkinChoice);

    state = 2;
  } else if (mousePressed && mouseClick && mouseX >= 12+width/4 && mouseX <= width/4-25+12+width/4 && mouseY >= height-(height/4+25) && mouseY <= height/4-25+height-(height/4+25)) {
    //println("hitbox10");
    println();
    pumpkinChoice = 10;
    println("Pumpkin choice: " +pumpkinChoice);

    state = 2;
  } else if (mousePressed && mouseClick && mouseX >= 12+width/4*2 && mouseX <= width/4-25+12+width/4*2 && mouseY >= height-(height/4+25) && mouseY <= height/4-25+height-(height/4+25)) {
    //println("hitbox11");
    println();
    pumpkinChoice = 11;
    println("Pumpkin choice: " +pumpkinChoice);

    state = 2;
  } else if (mousePressed && mouseClick && mouseX >= 12+width/4*3 && mouseX <= width/4-25+12+width/4*3 && mouseY >= height-(height/4+25) && mouseY <= height/4-25+height-(height/4+25)) {
    //println("hitbox12");
    println();
    pumpkinChoice = 12;
    println("Pumpkin choice: " +pumpkinChoice);
    state = 2;
  } else if (mousePressed && mouseClick && mouseX >= width-width/22 && mouseX <= width-width/22 + width/30 && mouseY >= height-(height/27)) {
    state = 3;
  }




  //If prev pressed
  if (mousePressed && state==2 && pumpkinChoice > 1 &&  mouseX >= width-12-width/6-width/6-width/24 && mouseX <= width-12-width/6-width/6-width/24+width/6 && mouseY >= height-height/12-10 && mouseY <= height/12+height-height/12-10 && pumpkinChoice > 1) {
    pumpkinChoice--;
    //If home pressed
  } else if (mousePressed && state==2 &&  mouseX >= 10 && mouseX <= width/24+width/8 && mouseY >= height-height/12-10 && mouseY <= height/12+height-height/12-10) {
    state=1;
  }

  //If next pressed
  if (mousePressed && state==2 && pumpkinChoice < 12 && mouseX >= width-12-width/6 && mouseX <= width/6+width-12-width/6 && mouseY >= height-height/12-10 && mouseY <= height/12+height-height/12-10) {
    pumpkinChoice++;
    println("next pressed");
    //If next pressed when on 12.
  } else if (mousePressed && state==2 &&  pumpkinChoice >= 12 && mouseX >= width-12-width/6 && mouseX <= width/6+width-12-width/6 && mouseY >= height-height/12-10 && mouseY <= height/12+height-height/12-10) {
    pumpkinChoice = 1;
  }
  //If home pressed while on the settings page.
  if (mousePressed && state==3 &&  mouseX >= 10 && mouseX <= width/24+width/8 && mouseY >= height-height/12-10 && mouseY <= height/12+height-height/12-10) {
    state=1;
  }
} 

void mouseDragged() {

  //If ellipse dragged
  if (state==3 && mouseX >= 20 && mouseX<= width-40 && mouseY >= height/2 -50 && mouseY <= height/2 + 50) {
    println("ellipse selected");
    ellipsePos = mouseX;
    //Map the value of mouseX, which is limited between 20 and the width-20, to the values 0.0 and 1.0. This is the max and min volume value.
    float amplitude = map(mouseX, 20, width-20, 0.0, 1.0);
    s.volume(amplitude);
  }
}




void infoPage() {
  background(#f1f2f6);
  fill(#5352ed);
  rect(0, 0, width, height/6);
  fill(255);
  String info = "Pumpkin "+pumpkinChoice;
  fill(0);
  textSize(32);
  text(info, 10, 10, width, 80);

  //Now we're on the info page, the pumpkin info displayed is determined by the pumpkin choice, which was set when we clicked a pumpkin.
  ArrayList<Pumpkin> pumpkins = new ArrayList<Pumpkin>();
  pumpkins.add(pumpkin1);
  pumpkins.add(pumpkin2);
  pumpkins.add(pumpkin3);
  pumpkins.add(pumpkin4);
  pumpkins.add(pumpkin5);
  pumpkins.add(pumpkin6);
  pumpkins.add(pumpkin7);
  pumpkins.add(pumpkin8);
  pumpkins.add(pumpkin9);
  pumpkins.add(pumpkin10);
  pumpkins.add(pumpkin11);
  pumpkins.add(pumpkin12);
  
  for (int i = 0; i <= pumpkins.size(); i++) {
    if(pumpkinChoice == i){
      Pumpkin p = pumpkins.get(i-1);
      p.display();
    }
  }

  //////////////

  //Home button
  fill(#5352ed);
  ellipse(40, height-height/12+25, height/12, height/12);
  fill(0);
  image(loadImage("home.png"), 15, height-height/12-5, 50, 50);

  //Prev button
  fill(255);
  ellipse(width-12-width/6-width/6-width/24+height/12/2, height-height/12+height/12/2-10, height/12, height/12);
  image(loadImage("prev.png"), width-12-width/6-width/6-width/24, height-height/12-10, height/12, height/12);

  //Next button
  fill(255);
  ellipse(width-10-height/12/2, height-height/12+height/12/2-10, height/12, height/12);
  image(loadImage("next.png"), width-10-height/12, height-height/12-10, height/12, height/12);
}


void drawImages() {
  //Drawing the big blue rectangles at the top and bottom of the menu page and adding some text.
  background(#f1f2f6);
  fill(#5352ed);
  rect(0, 0, width, height/6);
  rect(0, height-(height/24), width, height/24);
  image(loadImage("settings.png"), width-width/22, height-(height/27), width/30, width/30);

  String s = "Welcome.";
  String s2 = "Choose a pumpkin for more info.";
  fill(230);
  textSize(32);
  text(s, 10, height/6/5, width, 80);
  text(s2, 10, height/6/2, width, 80);



  //Loop through the array across the screen in increments of 4. xPosition is set for each row at the start of each loop.

  xPos = 10;
  for (int i=0; i<=3; i++) {
    image(images[i], xPos, height/2-height/4-25, width/4-25, height/4-25);
    xPos+= width/4;
  }

  xPos2 = 10;
  for (int i=4; i<8; i++) {
    image(images[i], xPos2, height/2-25, width/4-25, height/4-25);
    xPos2+= width/4;
  }

  xPos3 = 10;
  for (int i=8; i<12; i++) {
    image(images[i], xPos3, height-(height/4+25), width/4-25, height/4-25);
    xPos3+= width/4;
  }
}

void settingsPage() {

  background(#f1f2f6);
  fill(#5352ed);
  rect(0, 0, width, height/6);
  fill(255);
  String info = "Sound Settings";
  fill(0);
  textSize(32);
  text(info, 10, 10, width, 80);

  //Line and ellipse slider
  fill(0);
  rect(width/24, height/2, width-width/10, height/80);

  fill(#5352ed);
  ellipse(ellipsePos, height/2, 50, 50);

  String desc = "Drag to change volume.";
  text(desc, width/24, height/2+100, width, 80);

  //Home button
  fill(#5352ed);
  ellipse(40, height-height/12+25, height/12, height/12);
  fill(0);
  image(loadImage("home.png"), 15, height-height/12-5, 50, 50);
}
