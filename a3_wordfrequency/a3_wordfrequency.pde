// a3_wordfrequency
String[] lines;
String[][] frequencies;

int t = 240; //transparency
color c0 = color(0,0,0, t); //black
color c1 = color(255,255,255, t); //white
color c2 = color(255,0,0, t); //red
color c3 = color(0,255,0, t); //green
color c4 = color(0,0,255, t); //blue
color c5 = color(255,255,0, t); //yellow
color c6 = color(0,200,200, t); //ligth blue
color c7 = color(255,0,255, t); // pink
color c8 = color(217, 198, 158, t); //sandstone 

color[] myColors = {c0,c1,c2,c3,c4,c5,c6,c7,c8}; //color list

int paddle = 10;


void setup() {
  //general settings
  size(1000, 900);
  colorMode(RGB);
  rectMode(CENTER);
  background(255);
  stroke(0);
  
  //input handler
  lines = loadStrings("./data/wordfrequency.txt"); // FIXME: replace "test" with "wordfrequency"
  frequencies = new String[lines.length][2];
}


void draw() {
  //axis lines
  strokeWeight(2);
  line(paddle, height-paddle, width-paddle, height-paddle);
  line(width/2, paddle, width/2, height-paddle);

  float maxLength = 0;
  for (int idx = 0; idx < lines.length; idx++) {
    frequencies[idx] = lines[idx].split(": ");
    if (int(frequencies[idx][1]) > maxLength) {
      maxLength = float(frequencies[idx][1]);
    }
  }
  float horizFactor = (width-40) / maxLength;
  float boxHeight = (height- (paddle * 2)) / float(frequencies.length);

  //create colorful rectangles
  int luck;
  strokeWeight(2);
  for (int box = 1; box < frequencies.length + 1; box++) {
    luck = (box -1) % myColors.length;
    
    stroke(0);
    fill(myColors[luck]);
    rect(width/2, height - paddle - (box * boxHeight) + (boxHeight / 2), max(horizFactor * int(frequencies[box - 1][1]), 6), boxHeight);
  }

  noLoop();
}
