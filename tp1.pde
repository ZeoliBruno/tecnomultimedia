String titulo;
float T = height;
float S = 4.5;
PFont caligrafia;
PImage portada1;
color op1;
color op2;
color op3;
color op4;
color op5;
color op6;
float tiem;
float suma;
void setup() {
  size(700, 500);
  background(0);
  portada1 = loadImage("ready 5 edit.jpg");
  caligrafia = createFont("Ready Player One.otf", 30);
  textSize(100);
  textAlign(CENTER);
  titulo = "READY\nPLAYER\nONE";
  op1 = 255;
  op2 = 0;
  op3 = 0;
  op4 = 0;
  op5 = 0;
  op6 = 0;
  tiem = 0;
  suma = 1;
}
void draw() {
  tiem = tiem+suma;
  image(portada1, 0, 0, 700, 500);
  textFont(caligrafia);
  T = T - 26.5;
  S = S - 3.9;
  frameRate(5);
  textSize(100 + S);
  text(titulo, width/2, height + T);
  fill (48, random(255), 137);
  if (tiem > 26) {
    textSize(20);
    fill(15, random(255), 250, op1);
    text("Wade Watts/Parzival\nBy Tye Sheridan", 175, 125);
    text("Samantha Cock/Artemis\nBy Olivia Cooke", 525, 125);
    text("James Halliday\nBy Mark Rylance", 175, 375);
    text("Nolan Sorrento\nBy Ben Mendelsohn", 525, 375);
  }
  if (tiem > 47) {
    textSize(20);
    fill(198, 20, random(255), op2);
    text("Ogden Morrow/Curador\nBy Simon Pegg", 175, 125);
    text("Helen Harris/Hache\nBy Lena Waithe", 525, 125);
    text("Toshiro Yoshiaki/Daito\nBy Win Morisaki", 175, 375);
    text("Akihide Karatsu/Sho\nBy Phillip Zhao", 525, 375);
  }
  if (tiem > 68) {
    textSize(20);
    fill(random(255), 20, 320, op3);
    text("iRok\nBy T.J.Miller", 175, 125);
    text("Rick\nBy Ralph Ineson", 525, 125);
    text("F'Nale Zandor\nBy Hannah John-Kamen", 175, 375);
    text("Reb\nBy Letitia Wright", 525, 375);
  }
  if (tiem > 89) {
    textSize(20);
    fill(random(255), 85, 10, op4);
    text("Produced and Directed\nBy Steven Spielberg", 175, 125);
    text("Written\nBy Zak Penn", 525, 125);
    text("Writter\nBy Ernest Cline", 175, 375);
    text("Produced\nBy Dan Farah", 525, 375);
  }
  if (tiem> 111 && frameCount> 111) {
    textSize(50);
    fill(random(255), 150, random(255), op5);
    text("Official Soundtack\n 'Jump' By Van Helen", width/2, 200);
  }
  if (tiem> 122 || frameCount> 122) {
    textSize(40);
    fill(165, random(255), random(255), op6);
    text("Ready\nPlayer\nOne", width/2, 200);
  }
  if (tiem < 26) {
    op1 = 0;
  } else if (tiem == 26) { 
    op1 = 255;
  } else if (tiem == 46) {
    op1 = 0;
  } else if (tiem == 47) {
    op2 = 255;
  } else if (tiem == 67) {
    op2 = 0;
  } else if (tiem == 68) {
    op3 = 255;
  } else if (tiem == 88) {
    op3 = 0;
  } else if (tiem == 89) {
    op4 = 255;
  } else if (tiem == 110) {
    op4 = 0;
  } else if (tiem == 111) {
    op5 = 255;
  } else if (tiem == 126) {
    op5 = 0;
  } else if (tiem == 127) {
    op6 = 255;
  } else if (tiem == 137) {
    op6 = 0;
  }
  println("el tiempo es "+tiem);
  println("el frameCount es "+frameCount);
  println("el T es "+T);
  println("el S es "+S);
  if (mousePressed) {
    tiem = 0;
    suma = 1;
    frameCount = 0;
    T = height;
    S = 4.5;
  }
}
