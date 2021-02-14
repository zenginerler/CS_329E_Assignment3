// a3_novelvisualization
String[] words;

PFont font;
int fontSize = 32;

int horizontal = 0;
int vertical = 0;


//String[] fontlist = PFont.list();
//printArray(fontlist);
//random();

void setup() {
  //general settings
  size(700, 600);
  background(255);
  fill(0);
  
  //load the input
  words = loadStrings("../uniquewords.txt");
  
  //font settings
  font = createFont("Serif.plain", fontSize);
  textFont(font);
  
  //will not loop without interaction
  noLoop();
}

void draw() {



}

void mousePressed(){
  cloud(); //
}

void cloud(){
  //clean the canvas
  background(255);
  
  //reset boundaries
  horizontal = 0;
  vertical = 0;
  
  int len = 0;
  // funtion body
  while (horizontal < width && vertical < height){
    
      // process the input
      for (int i = 0; i < words.length; i++) {
        println(words[i].length());
      }
  }

}


































/*
void setup() {
  //canvas settings
  size(700, 600);
  background(255);

  //text input/output handler
  int wordCount = 0;
  String[] lines = loadStrings("mytext.txt");
  output = createWriter("outputPositions.txt");

  // process the input
  for (int i = 0; i < lines.length; i++) {
    println(lines[i].length());

    String [] subwords = split(lines[i], " ");

    wordCount += subwords.length;
    println("wordCount:", wordCount); //print word count per line

    for (int j = 0; j < subwords.length; j++) {
      output.println(subwords[j]);
    }
  }
}

void draw() {
  stroke(0);
  fill(0);
  textSize(10);
  text("Press a button to save changes", width/2-75, height/2);
}


void keyPressed() {
  output.flush();
  output.close();
}
*/
