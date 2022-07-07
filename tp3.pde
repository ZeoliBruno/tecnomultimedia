//https://youtu.be/N2IJ0sfoZMU

PFont font;

int espacioH = 25;
int espacioV = 30;

int tam = 10;

color huecos = color(102, 102, 102);

color fondo = color(200);

color[] colores = { color(255, 217, 0), color(255, 132, 0), color(255, 0, 0), color(255, 0, 209), color(92, 0, 255), color(0, 216, 37)};

int[] claves = new int[4];

int[] miClave = new int[0];

int posicionX = 25;
int posicionY = 30;

int negras = 0;

int blancas = 0;

int intentos = 0;

void setup() {
  size(250, 550);
  font = loadFont("FuturaBT-Medium-48.vlw");
  generarClave();
}


void draw() {
  if (keyPressed && key=='k') {

    posicionX=25;
    posicionY=30;
    generarClave();
  }
  insertarClave();
}

void generarClave() {

  for (int i=0; i<4; i++) {
    claves[i] = 1+int(random(6));
    print(" Clave" + i +": "+ claves[i]);
  }

  if (claves[0]==claves[1]||claves[0]==claves[2]||claves[0]==claves[3]||claves[1]==claves[2]||claves[1]==claves[3]||claves[2]==claves[3]) {
    generarClave();
  }

  tablero();
}

void pincho(color c) {
  fill(c);
  strokeWeight(4);
  stroke(32, 32, 32, 80);
  ellipse(posicionX, posicionY, 15, 15);
}

void insertarClave() {
  int radio = 7;
  cursor();
  if (mouseX>35-radio && mouseX<35+radio && mouseY>525-radio && mouseY<525+radio && mousePressed) {
    miClave = append(miClave, 1);
    pincho(colores[0]);
    delay(500);
    posicionX+=25;
  }
  if (mouseX>70-radio && mouseX<70+radio && mouseY>525-radio && mouseY<525+radio && mousePressed) {
    miClave = append(miClave, 2);
    pincho(colores[1]);
    delay(500);
    posicionX+=25;
  }
  if (mouseX>105-radio && mouseX<105+radio && mouseY>525-radio && mouseY<525+radio && mousePressed) {
    miClave = append(miClave, 3);
    pincho(colores[2]);
    delay(500);
    posicionX+=25;
  }
  if (mouseX>140-radio && mouseX<140+radio && mouseY>525-radio && mouseY<525+radio && mousePressed) {
    miClave = append(miClave, 4);
    pincho(colores[3]);
    delay(500);
    posicionX+=25;
  }
  if (mouseX>175-radio && mouseX<175+radio && mouseY>525-radio && mouseY<525+radio && mousePressed) {
    miClave = append(miClave, 5);
    pincho(colores[4]);
    delay(500);
    posicionX+=25;
  }
  if (mouseX>210-radio && mouseX<210+radio && mouseY>525-radio && mouseY<525+radio && mousePressed) {
    miClave = append(miClave, 6);
    pincho(colores[5]);
    delay(500);
    posicionX+=25;
  }

  if (posicionX>100) {
    posicionX=25;
    posicionY+=30;
  }

  if (miClave.length == 4) { 

    compararClaves();
    miClave = new int[0];
    delay(500);
  }
}

void cursor() {

  int radio = 7;
  if (
    mouseX>35-radio && mouseX<35+radio && mouseY>525-radio && mouseY<525+radio 
    ||
    mouseX>70-radio && mouseX<70+radio && mouseY>525-radio && mouseY<525+radio
    ||
    mouseX>105-radio && mouseX<105+radio && mouseY>525-radio && mouseY<525+radio
    ||
    mouseX>140-radio && mouseX<140+radio && mouseY>525-radio && mouseY<525+radio
    ||
    mouseX>175-radio && mouseX<175+radio && mouseY>525-radio && mouseY<525+radio
    ||
    mouseX>210-radio && mouseX<210+radio && mouseY>525-radio && mouseY<525+radio
    ) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}


void compararClaves() {

  if (claves[0]==miClave[0]) {    
    negras++;
  }
  if (claves[1]==miClave[1]) {    
    negras++;
  }
  if (claves[2]==miClave[2]) {    
    negras++;
  }
  if (claves[3]==miClave[3]) {    
    negras++;
  }

  if (claves[0]==miClave[1] || claves[0]==miClave[2] ||claves[0]==miClave[3]) {    
    blancas++;
  }
  if (claves[1]==miClave[0] || claves[1]==miClave[2] || claves[1]==miClave[3]) {    
    blancas++;
  }
  if (claves[2]==miClave[0] || claves[2]==miClave[1] || claves[2]==miClave[3]) {    
    blancas++;
  }
  if (claves[3]==miClave[0] || claves[3]==miClave[1] || claves[3]==miClave[2]) {    
    blancas++;
  }


  for (int i=0; i<4; i++) {    
    println(miClave[i]);
  }
  for (int i=0; i<4; i++) {    
    println(claves[i]);
  }
  println("Blancas: " + blancas);
  println("Negras: " + negras);


  posicionX=width/2+espacioH;
  posicionY-=30;

  for (int i=0; i<blancas; i++) {
    pincho(color(255, 255, 255));
    posicionX+=25;
  }

  for (int i=0; i<negras; i++) {
    pincho(color(0, 0, 0));
    posicionX+=25;
  }

  if (negras==4) {
    ganaste(0, 360);
  }

  blancas = 0;
  negras = 0;

  intentos++;

  if (intentos>=10) {

    posicionX=25;
    posicionY=30;

    perdiste(0, 360);
    intentos=0;
  }
}



void ganaste(int x, int y) {
  fill(200);
  noStroke();
  rect(x, y-10, width, 120);
  textAlign(CENTER);
  textFont(font, 24);
  fill(100);
  ellipse(width/2, y+50, 150, 150);
  fill(200);
  text("GANASTE", x, y+30, width, 125);
  textFont(font, 18);
  text("Press 'k'", x, y+60, width, 125);
}


void perdiste(int x, int y) {
  fill(200);
  noStroke();
  rect(x, y-10, width, 120);
  textAlign(CENTER);
  textFont(font, 24);
  fill(100);
  ellipse(width/2, y+50, 150, 150);
  fill(200);
  text("PERDISTE", x, y+30, width, 125);
  textFont(font, 18);
  text("PRESS 'k'", x, y+60, width, 125);
}


void instrucciones(int x, int y) {  
  textFont(font, 15);
  textAlign(CENTER);
  String s = "Adivina la clave secreta haciendo clic en los colores en el orden deseado. Pulsa 'k' para reiniciar";
  fill(32, 32, 32, 80);
  text(s, x, y+40, width-60, 125);  
  textFont(font, 36);
  text("DEC   DE", x, y, width-60, 125);
  fill(colores[3]);
  stroke(32, 32, 32, 80);
  strokeWeight(6);
  ellipse(x+107, y+13, 22, 22);
}
void tablero() {
  noStroke();
  background(fondo);
  fill(huecos);

  for (int i=1; i<=4; i++) {
    for (int ii=1; ii<=10; ii++) {
      ellipse(i*espacioH, ii*espacioV, tam, tam);
    }
  }

  for (int i=1; i<=4; i++) {
    for (int ii=1; ii<=10; ii++) {
      ellipse(width/2+i*espacioH, ii*espacioV, tam, tam);
    }
  }

  for (int i=1; i <7; i++) {
    fill(colores[i-1]);
    strokeWeight(4);
    stroke(32, 32, 32, 80);
    ellipse(i*(width/7), 525, 15, 15);
  }

  instrucciones(30, 360);
}
