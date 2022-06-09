//https://youtu.be/_jG_WHnXXzM

int cant = 20;
float tam;
int col;
int col2;

void setup() {
  size(400, 400);
  col = 100;
  col2 = 85;
}

void draw() {
  background(4);
  tam = 1;
  for (int i=1; i<cant; i++) {
    noFill();
    tam = (tam * 1.5);
    stroke(col, col2, mouseX);
    ellipse(mouseX, 400, tam, height);
    ellipse(mouseX, 0, tam, height);
  }
  println(col);
}
void mousePressed() {
  col = 100;
  col2 = 85;
}
void keyPressed() {
  if (keyCode == RIGHT) {
    col2 = col2 +10;
  } else if (keyCode == LEFT) {
    col2 = col2 -10;
  } else if (keyCode == UP) {
    col = col + 10;
  } else if (keyCode == DOWN) {
    col = col -10;
  }
}
