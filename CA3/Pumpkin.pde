public class Pumpkin {
  //Characteristics
  PImage img;
  String name;
  String description;
  String size;
  String bestUse;

  //Default constructor
  public Pumpkin() {
    img = loadImage("0.jpg");
    name = "Jack Be Little";
    description="This tiny pumpkin fits into the palm of your hand. Bright orange, smooth fruits are an arts-and-crafter's dream. Fits any garden! Compact vines spread 10-15 ft., producing up to 20 edible fruits.";
    size="Small";
    bestUse="Decoration";
  }

  //Constructor for just images
  public Pumpkin(PImage tempImg) {
    img = tempImg;
  }

  //Constructor for all variables
  public Pumpkin(PImage tempImg, String tempName, String tempDescription, String tempSize, String tempBestUse) {
    img = tempImg;
    name = tempName;
    description = tempDescription;
    size = tempSize;
    bestUse = tempBestUse;
  }



  //Get methods
  public PImage getImg() {
    return img;
  }

  public String getName() {
    return name;
  }

  public String getDescription() {
    return description;
  }

  public String getSize() {
    return size;
  }

  public String getBestUse() {
    return bestUse;
  }



  //Set methods
  public void setImg(PImage tempImg) {
    img = tempImg;
  }

  public void setName(String tempName) {
    name = tempName;
  }

  public void setDescription(String tempDescription) {
    description = tempDescription;
  }

  public void setSize(String tempSize) {
    size = tempSize;
  }

  public void setBestUse(String tempBestUse) {
    bestUse = tempBestUse;
  }

  //Run to display the pumpkin info
  public void display() {
    textSize(25);
    image(img, 10, height/10, width/2, height/2);
    String n = "Name: ";
    text(n+name, width/2+width/24, height/8);
    String si = "Size: ";
    text(si+size, width/2+width/24, height/3);
    String b = "Best Use: ";
    text(b+bestUse, width/2+width/24, height/2);
    String d = "Description: ";
    text(d+description, 10, height/2+height/8, width-10, height/2-10);
  }
}
