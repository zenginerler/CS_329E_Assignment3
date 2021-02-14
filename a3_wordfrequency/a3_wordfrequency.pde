// a3_wordfrequency
void setup() {
  size(520, 520);
}

void draw() {
  background(255);
  stroke(0);
  strokeWeight(3);
  line(10, 510, 500, 510);
  line(260, 510, 260, 10);
  String[] lines = loadStrings("wordfrequency.txt");
  String[][] frequencies = new String[lines.length][2];

  float maxLength = 0;
  for (int idx = 0; idx < lines.length; idx++) {
    frequencies[idx] = lines[idx].split(": ");
    if (int(frequencies[idx][1]) > maxLength) {
      maxLength = float(frequencies[idx][1]);
    }
  }
  float horizFactor = 500.0 / maxLength;
  float boxHeight = 500.0 / float(frequencies[frequencies.length - 1][0]);

  rectMode(CENTER);
  colorMode(RGB);
  fill(255, 0, 0, 50);
  for (int box = 1; box < frequencies.length + 1; box++) {
    rect(260, 510 - (int(frequencies[box - 1][0]) * boxHeight) + (boxHeight / 2), horizFactor * int(frequencies[box - 1][1]), boxHeight);
  }

  noLoop();
}
