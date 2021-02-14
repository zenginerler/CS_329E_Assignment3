// a3_novelvisualization
String[] words;

PFont font;
int fontSize = 32;

//preset colors
color [] paint = {
  color(255, 255, 255), color(0, 0, 0)}; //white & black
color [][] colorList = {
  {color (120, 1, 22), color (247, 181, 56), color (83, 221, 108)}, 
  {color (26, 200, 237), color (204, 85, 0), color (54, 33, 62)}, 
  {color (35, 61, 77), color (222, 60, 75), color (252, 202, 70)}};
  // 0 short | 1 medium | 2 long


void setup() {
  //general settings
  size(700, 600);
  background(255);
  colorMode(RGB, 255, 255, 255);

  //load the input
  words = loadStrings("./data/uniquewords.txt");

  //font settings
  font = createFont("Pacifico-Regular.ttf", fontSize);
  textFont(font);
}


void draw() {
  cloud();
  //don't loop continuously
  noLoop();
}


void cloud() {
  //clean the canvas
  int luck = (int) random(0, 2);
  background(paint[luck]);


  //setting variables
  fontSize = (int) textAscent()+5;  // prevents collisions caused by the font
  int wordCount = words.length; // n-1
  int horizontal = 10;
  int vertical = fontSize;

  //create a list consisting from random words
  ArrayList<String> randomWords = new ArrayList<String>(wordCount);
  for (int i=0; i<wordCount; i++) {
    int index = (int) random(0, words.length-1); 
    randomWords.add(words[index]);
  }

  // main funtion body
  int counter = 0;
  luck = (int) random(0, 3); //color palette
  while ((vertical < height-10) && (counter < wordCount-1)) {
    String word = randomWords.get(counter);
    String nextWord = randomWords.get(counter+1);

    //color selection
    if (word.length() < 5) {
      fill(colorList[luck][0]);
    } else if (word.length() < 8) {
      fill(colorList[luck][1]);
    } else {
      fill(colorList[luck][2]);
    }

    text(word, horizontal, vertical);
    horizontal += textWidth(word)+10;

    // location check
    if (horizontal + textWidth(nextWord)+5 > width) {
      horizontal = 10;
      vertical += fontSize;
    }

    counter++;
  }
}


void mousePressed() {
  //recreate the word cloud for every mouse click
  loop();
}
