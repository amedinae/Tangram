//Variable con el color blanco para contar el numero de pixeles con este color //<>//
color White = color(255, 255, 255);
//Numeros de pixeles blancos
int CountPixelsWhite;

boolean Complete;

color colorfigura;

PImage Fondo;
PImage Miniatura1;
PImage Miniatura2;
PImage Miniatura3;
PImage Miniatura4;
PImage Miniatura5;
PImage Miniatura6;
PImage Miniatura7;
PImage Miniatura8;
PImage Miniatura9;
PImage Miniatura10;

//Nivel del juego
int Nivel = 0;

//Posicion de figuras, T significa triangulo y C cuadrilatero
//Figura 1
int T1X;
int T1Y;
//Figura 2
int T2X;
int T2Y;
//Figura 3
int T3X;
int T3Y;
//Figura 4
int T4X;
int T4Y;
//Figura 5
int T5X;
int T5Y;
//Figura 6
int C1X;
int C1Y;
//Figura 7
int C2X;
int C2Y;

//Estas variables permiten mover las piezas desde cualquier posicion de ellas. Los Delta son el cambio de posicion entre donde se dio click hasta donde se mueve el mouse

//Posicion del mouse unicamente cuando se presiono, no cambia al mover el mouse.
int MouseXi;
int MouseYi;

//Posicion del mouse mientras se mueve el mouse.
int MouseXf;
int MouseYf;

//Delta de la posicion del mouse entre dal click y soltarlo
int DeltaX;
int DeltaY;

//Cuando la pieza 1 esta seleccionada este delta es igual al cambio de posicion del mouse entre cuando se dio click hasta donde se mueve
int DeltaT1X;
int DeltaT1Y;

//Cuando la pieza 2 esta seleccionada este delta es igual al cambio de posicion del mouse entre cuando se dio click hasta donde se mueve
int DeltaT2X;
int DeltaT2Y;

//Cuando la pieza 3 esta seleccionada este delta es igual al cambio de posicion del mouse entre cuando se dio click hasta donde se mueve
int DeltaT3X;
int DeltaT3Y;

//Cuando la pieza 4 esta seleccionada este delta es igual al cambio de posicion del mouse entre cuando se dio click hasta donde se mueve
int DeltaT4X;
int DeltaT4Y;

//Cuando la pieza 5 esta seleccionada este delta es igual al cambio de posicion del mouse entre cuando se dio click hasta donde se mueve
int DeltaT5X;
int DeltaT5Y;

//Cuando la pieza 6 esta seleccionada este delta es igual al cambio de posicion del mouse entre cuando se dio click hasta donde se mueve
int DeltaC1X;
int DeltaC1Y;

//Cuando la pieza 7 esta seleccionada este delta es igual al cambio de posicion del mouse entre cuando se dio click hasta donde se mueve
int DeltaC2X;
int DeltaC2Y;

//Esta variable se usa para definir la posicion inicial del mouse al dar click. Es true todo momento exepto cuando el mouse se mueve presionado
boolean click = true;

//Desface de figuras. El desface es la distancia que tiene la posicion de la pieza hasta una posicion multiplo de 10
//Desface Figura 1
int DesfaceT1X;
int DesfaceT1Y;

//Desface Figura 1
int DesfaceT2X;
int DesfaceT2Y;

//Desface Figura 1
int DesfaceT3X;
int DesfaceT3Y;

//Desface Figura 1
int DesfaceT4X;
int DesfaceT4Y;

//Desface Figura 1
int DesfaceT5X;
int DesfaceT5Y;

//Desface Figura 1
int DesfaceC1X;
int DesfaceC1Y;

//Desface Figura 1
int DesfaceC2X;
int DesfaceC2Y;

//Rotacion de figuras, Son numeros enteros que se multiplican por un cuarto de PI para dar el angulo de rotacion de cada figura
int RT1 = 2;
int RT2 = 0;
int RT3 = 2;
int RT4 = 1;
int RT5 = -1;
int RC1 = 0;
int RC2 = -1;

//Colores de Figuras
//Rojo
color c1 = color(255, 0, 0);
//Verde
color c2 = color(0, 255, 0);
//Azul
color c3 = color(0, 0, 255);
//Amarillo
color c4 = color(255, 255, 0);
//Morado
color c5 = color(255, 0, 255);
//Celeste
color c6 = color(0, 255, 255);
//Naranja
color c7 = color(255, 117, 020);

//Movimiento de Figuras. El valor de cada boolean es false. Una pieza solo se mueve cuando su boolean tiene valor true
boolean MoveT1;
boolean MoveT2;
boolean MoveT3;
boolean MoveT4;
boolean MoveT5;
boolean MoveC1;
boolean MoveC2;
int Move = 0;/*Evita mover varias piezas a la vez, el valor por defecto es 0 que significa que no se esta moviendo ninguna pieza. 
 Una pieza solo se puede mover cuando Move es igual a 0 o Move es igual al numero de la pieza
 */

//Se inicia el programa con un zona de trabajo de 1350x650 pixeles
void setup() {
  size(1300, 650);

  Miniatura1 = loadImage("Cubo-Nivel1.png");
  Miniatura2 = loadImage("Aguila-Nivel2.png");
  Miniatura3 = loadImage("Arbol-Nivel3.png");
  Miniatura4 = loadImage("Casa-Nivel4.png");
  Miniatura5 = loadImage("Montaña-Nivel5.png");
  Fondo = loadImage("Fondo.png");
}

//Esta funcion se llama al soltar el mouse
void mouseReleased() {
  //Hace 0 cualquier movimiento anterior con el mouse
  MouseXi = mouseX;
  MouseYi = mouseY;
  MouseXf = mouseX;
  MouseYf = mouseY;


  //Regresa el valor de las variables de movimiento a su valor por defecto
  MoveT1 = false;
  MoveT2 = false;
  MoveT3 = false;
  MoveT4 = false;
  MoveT5 = false;
  MoveC1 = false;
  MoveC2 = false;
  Move = 0;
  click = true;

  //Define la posicion final de la pieza al terminar de moverla
  T1X += DeltaT1X;
  T1Y += DeltaT1Y;

  T2X += DeltaT2X;
  T2Y += DeltaT2Y;

  T3X += DeltaT3X;
  T3Y += DeltaT3Y;

  T4X += DeltaT4X;
  T4Y += DeltaT4Y;

  T5X += DeltaT5X;
  T5Y += DeltaT5Y;

  C1X += DeltaC1X;
  C1Y += DeltaC1Y;

  C2X += DeltaC2X;
  C2Y += DeltaC2Y;

  //Al terminar de mover una pieza el delta de posicion de esta vuelve a ser 0.
  DeltaX =0;
  DeltaY =0;

  DeltaT1X = 0;
  DeltaT1Y = 0;

  DeltaT2X = 0;
  DeltaT2Y = 0;

  DeltaT3X = 0;
  DeltaT3Y = 0;

  DeltaT4X = 0;
  DeltaT4Y = 0;

  DeltaT5X = 0;
  DeltaT5Y = 0;

  DeltaC1X = 0;
  DeltaC1Y = 0;

  DeltaC2X = 0;
  DeltaC2Y = 0;
}

//Esta funcion se llama cuando el mouse esta presionado
void mousePressed() {
  /*click solo es verdadero cuando el mouse no se mueve, 
   cuando el mouse se mueve se hace falso y MouseXi y MouseYi son iguales a la posicion donde se dio click y no cambian mientras se mueve el mouse*/
  if (click) {
    Move = 0;
    MoveT1 = false;
    MoveT2 = false;
    MoveT3 = false;
    MoveT4 = false;
    MoveT5 = false;
    MoveC1 = false;
    MoveC2 = false;
    MouseXi = mouseX;
    MouseYi = mouseY;
    MouseXf = mouseX;
    MouseYf = mouseY;
    //Se obtiene el color del pixel donde se encuentra el mouse y se asigna a la variable colorfigura
    colorfigura = get(mouseX, mouseY); //Obtiene el color del pixel donde se encuentra el mouse
    println(colorfigura);
  } else {
    //No hacer nada
  }
}

//Esta funcion se llama cuando el mouse se mueve presionado
void mouseDragged() {
  //Se da el valor de falso a la variable click para que MouseXi y MouseYi no cambien al mover el mouse
  click = false;
  //Se da el valor de la posicion del mouse a estas variables
  MouseXf = mouseX;
  MouseYf = mouseY;
}

//Dentro de la funcion Draw el codigo se ejecuta constantemente
void draw() {
  println(C2X);
  println(C2Y);


  if (Nivel != 0) {
    background(Fondo);
  } else {
    //No hacer nada
  }

  //El numero de pixeles blancos se reinicia tras cada frame
  CountPixelsWhite = 0;

  //Se pinta el color de fondo en cada frame
  if (Nivel == 0) {
    background(Fondo);
  }

  //Evita que las piezas salgan de la pantalla
  if (T1X<-250||T1X>1100||T1Y<0||T1Y>800) {
    T1X = -70;
    T1Y = 530;
    RT1 = 2;
  }
  if (T2X<20||T2X>1400||T2Y<-290||T2Y>550) {
    T2X = 240;
    T2Y = 10;
    RT2 = 0;
  }
  if (T3X<-60||T3X>1300||T3Y<-100||T3Y>620) {
    T3X = 1130;
    T3Y = 40;
    RT3 = 2;
  }
  if (T4X<-150||T4X>1220||T4Y<-70||T4Y>650) {
    T4X = 980;
    T4Y = 150;
    RT4 = 1;
  }
  if (T5X<-60||T5X>1280||T5Y<50||T5Y>750) {
    T5X = 1100;
    T5Y = 390;
    RT5 = -1;
  }
  if (C1X<-150||C1X>1250||C1Y<-50||C1Y>700) {
    C1X = 990;
    C1Y = 420;
    RC1 = 0;
  }
  if (C2X<-100||C2X>1300||C2Y<110||C2Y>830) {
    C2X = 1100;
    C2Y = 730;
    RC2 = -2;
  }

  //Interfaz grafica
  if (Nivel == 0) {

    fill(0);
    textSize(30);
    text("Instrucciones", 1050, 600);

    fill(0);
    textSize(100);
    text("TANGRAM", 400, 90);

    image (Miniatura1, 100, 150);
    textSize(30);
    fill(0);
    text("Nivel 1", 150, 360);

    image (Miniatura2, 300, 150);
    textSize(30);
    fill(0);
    text("Nivel 2", 350, 360);

    image (Miniatura3, 500, 150);
    textSize(30);
    fill(0);
    text("Nivel 3", 550, 360);

    image (Miniatura4, 700, 150);
    textSize(30);
    fill(0);
    text("Nivel 4", 750, 360);

    image (Miniatura5, 900, 150);
    textSize(30);
    fill(0);
    text("Nivel 5", 950, 360);
  }
  //Seleccion de nivel
  if (Nivel==0) {

    if ((mousePressed==true)&&(click)&&(mouseX>1020)&&(mouseX<1270)&&(mouseY>560)&&(mouseY<620)) {
      Nivel = -1;
    }

    if ((mousePressed==true)&&(click)&&(mouseX>100)&&(mouseX<300)&&(mouseY>150)&&(mouseY<350)) {
      Nivel = 1;
      T1X = -70;
      T1Y = 530;
      T2X = 240;
      T2Y = 10;
      T3X = 1130;
      T3Y = 40;
      T4X = 980;
      T4Y = 150;
      T5X = 1100;
      T5Y = 390;
      C1X = 990;
      C1Y = 420;
      C2X = 1100;
      C2Y = 730;
      RT1 = 2;
      RT2 = 0;
      RT3 = 2;
      RT4 = 1;
      RT5 = -1;
      RC1 = 0;
      RC2 = -2;
    }
    if ((mousePressed==true)&&(click)&&(mouseX>300)&&(mouseX<500)&&(mouseY>150)&&(mouseY<350)) {
      Nivel = 2;
      T1X = -70;
      T1Y = 530;
      T2X = 240;
      T2Y = 10;
      T3X = 1130;
      T3Y = 40;
      T4X = 980;
      T4Y = 150;
      T5X = 1100;
      T5Y = 390;
      C1X = 990;
      C1Y = 420;
      C2X = 1100;
      C2Y = 730;
      RT1 = 2;
      RT2 = 0;
      RT3 = 2;
      RT4 = 1;
      RT5 = -1;
      RC1 = 0;
      RC2 = -2;
    }
    if ((mousePressed==true)&&(click)&&(mouseX>500)&&(mouseX<700)&&(mouseY>150)&&(mouseY<350)) {
      Nivel = 3;
      T1X = -70;
      T1Y = 530;
      T2X = 240;
      T2Y = 10;
      T3X = 1130;
      T3Y = 40;
      T4X = 980;
      T4Y = 150;
      T5X = 1100;
      T5Y = 390;
      C1X = 990;
      C1Y = 420;
      C2X = 1100;
      C2Y = 730;
      RT1 = 2;
      RT2 = 0;
      RT3 = 2;
      RT4 = 1;
      RT5 = -1;
      RC1 = 0;
      RC2 = -2;
    }
    if ((mousePressed==true)&&(click)&&(mouseX>700)&&(mouseX<900)&&(mouseY>150)&&(mouseY<350)) {
      Nivel = 4;
      T1X = -70;
      T1Y = 530;
      T2X = 240;
      T2Y = 10;
      T3X = 1130;
      T3Y = 40;
      T4X = 980;
      T4Y = 150;
      T5X = 1100;
      T5Y = 390;
      C1X = 990;
      C1Y = 420;
      C2X = 1100;
      C2Y = 730;
      RT1 = 2;
      RT2 = 0;
      RT3 = 2;
      RT4 = 1;
      RT5 = -1;
      RC1 = 0;
      RC2 = -2;
    }
    if ((mousePressed==true)&&(click)&&(mouseX>900)&&(mouseX<1100)&&(mouseY>150)&&(mouseY<350)) {
      Nivel = 5;
      T1X = -70;
      T1Y = 530;
      T2X = 240;
      T2Y = 10;
      T3X = 1130;
      T3Y = 40;
      T4X = 980;
      T4Y = 150;
      T5X = 1100;
      T5Y = 390;
      C1X = 990;
      C1Y = 420;
      C2X = 1100;
      C2Y = 730;
      RT1 = 2;
      RT2 = 0;
      RT3 = 2;
      RT4 = 1;
      RT5 = -1;
      RC1 = 0;
      RC2 = -2;
    }
  }

  //Instrucciones
  if (Nivel == -1) {
    fill(0);
    textSize(70);
    text("Instrucciones", 450, 100);
    textSize(40);
    text("Para ganar debes completar la figura utilizando", 200, 170);
    text("las piezas dadas, para esto puedes mover y rotar", 200, 210);
    text("con teclado y mouse las piezas. Para seleccionar", 200, 250);
    text("con el mouse una pieza debes dar click izquierdo", 200, 290);
    text("en ella y mantener presionado para moverla, girando", 200, 330);
    text("la rueda puedes rotarla. Con el teclado presionando", 200, 370);
    text("TAB puedes ir seleccionando cada pieza, el movimiento", 200, 410);
    text("se da con las teclas WASD y se rota con Q y E", 200, 450);
  }
  //Marcos del tangram dependiendo el nivel
  if (Nivel==1) {
    noStroke();
    fill(255);
    rect(400, 200, 400, 400);
  }

  if (Nivel==2) {
    fill(255);
    noStroke();
    pushMatrix();
    translate(650, 450);
    rotate(3*PI/4);
    triangle(0, 0, 200, 0, 0, -200);
    popMatrix();
    pushMatrix();
    translate(650, 50);
    rotate(0);
    triangle(0, 0, 0, 400, -200, 200);
    popMatrix();
    pushMatrix();
    translate(930, 390);
    rotate(-3*PI/4);
    triangle(0, 0, 400, 0, 200, -200);
    popMatrix();
    pushMatrix();
    translate(561, 140);
    rotate(3*PI/4);
    triangle(0, 0, 200, 0, 100, 100);
    popMatrix();
    pushMatrix();
    translate(421, 210);
    rotate(-5*PI/4);
    quad(0, 0, 100, -100, 200, 0, 100, 100);
    popMatrix();
    pushMatrix();
    translate(420, 490);
    rotate(PI/-4);
    triangle(0, 0, 0, -200, 100, -100);
    popMatrix();
    pushMatrix();
    translate(680, 390);
    rotate(PI/2);
    quad(0, 0, 0, -200, 100, -300, 100, -100);
    popMatrix();
  }
  if (Nivel == 3) {
    fill(255);
    noStroke();
    pushMatrix();
    translate(730, 80);
    rotate(3*PI/4);
    triangle(0, 0, 200, 0, 0, -200);
    popMatrix();
    pushMatrix();
    translate(450, 500);
    rotate(-3*PI/4);
    triangle(0, 0, 0, 400, -200, 200);
    popMatrix();
    pushMatrix();
    translate(1010, 500);
    rotate(-3*PI/4);
    triangle(0, 0, 401, 1, 200, -200);
    popMatrix();
    pushMatrix();
    translate(870, 360);
    rotate(5*PI/4);
    triangle(0, 0, 200, 0, 100, 100);
    popMatrix();
    pushMatrix();
    translate(800, 500);
    rotate(-5*PI/4);
    quad(0, 0, 99, -99, 199, 0, 99, 99);
    popMatrix();
    pushMatrix();
    translate(870, 220);
    rotate(-5*PI/4);
    triangle(0, 0, 0, -200, 100, -100);
    popMatrix();
    pushMatrix();
    translate(450, 360);
    rotate(PI/4);
    quad(0, 0, 0, -200, 100, -300, 100, -100);
    popMatrix();
  }
  if (Nivel == 4) {
    fill(255);
    noStroke();
    pushMatrix();
    translate(701, 351);
    rotate(5*PI/4);
    triangle(0, 0, 200, 0, 0, -200);
    popMatrix();
    pushMatrix();
    translate(500, 210);
    rotate(-2*PI/4);
    triangle(0, 0, 0, 400, 200, 200);
    popMatrix();
    pushMatrix();
    translate(840, 490);
    rotate(PI/4);
    triangle(0, 0, -401, 1, -200, -200);
    popMatrix();
    pushMatrix();
    translate(560, 490);
    rotate(7*PI/4);
    triangle(0, 0, 200, 0, 100, 100);
    popMatrix();
    pushMatrix();
    translate(700, 490);
    rotate(-5*PI/4);
    quad(0, 0, 99, -99, 199, 0, 99, 99);
    popMatrix();
    pushMatrix();
    translate(700, 489);
    rotate(-5*PI/4);
    triangle(0, 0, 0, -200, 100, -100);
    popMatrix();
    pushMatrix();
    translate(840, 630);
    rotate(-PI/4);
    quad(0, 0, 0, -200, 100, -300, 100, -100);
    popMatrix();
  }
  if (Nivel == 5) {
    fill(255);
    noStroke();
    pushMatrix();
    translate(650, 490);
    rotate(9*PI/4);
    triangle(0, 0, 200, 0, 0, -200);
    popMatrix();
    pushMatrix();
    translate(510, 348);
    rotate(PI/4);
    triangle(0, 0, 0, 400, 200, 200);
    popMatrix();
    pushMatrix();
    translate(790, 350);
    rotate(5*PI/4);
    triangle(0, 0, -400, 2, -200, -198);
    popMatrix();
    pushMatrix();
    translate(650, 490);
    rotate(9*PI/4);
    triangle(0, 0, 200, 0, 100, 100);
    popMatrix();
    pushMatrix();
    translate(550, 390);
    rotate(0);
    quad(0, 0, 101, -101, 201, 0, 101, 101);
    popMatrix();
    pushMatrix();
    translate(510, 490);
    rotate(-5*PI/4);
    triangle(0, 0, 0, -200, 100, -100);
    popMatrix();
    pushMatrix();
    translate(510, 350);
    rotate(3*PI/4);
    quad(0, 0, 0, -200, 100, -300, 100, -100);
    popMatrix();
    triangle(550, 390, 230, 630, 1070, 630);
  }
  /*Seleccionar varias piezas al mismo tiempo, no se como leer los pixeles dentro del area seleccionada
   if (click==false) {
   if (Move == 0) {
   pushMatrix();
   translate(MouseXi, MouseYi);
   noFill();
   rect(0, 0, DeltaX, DeltaY);
   popMatrix();
   }
   }*/

  //Creacion de piezas
  //Se hace pushMatrix y popMatrix para realizar transformaciones a la figura. # significa el numero de la figura
  //Se traslada el origen del eje de coordenadas a la posicion de la figura T#X y T#Y, si la figura esta en movimiento su posicion se ve afectada por el cambio de la posicion
  //Rotacion: 
  if (Nivel!=0) {
    fill (1);
    textSize(20);
    text("Menu Principal", 50, 35);
    triangle(30, 30, 50, 10, 50, 50);
    if ((mousePressed==true&&(mouseButton==LEFT))&&(colorfigura==-16711423)) {
      Nivel = 0;
    }
  }
  if (Nivel!=0&&Nivel!=-1) {

    pushMatrix();
    translate(T1X+DeltaT1X+200, T1Y+DeltaT1Y-100);
    rotate(RT1*PI/4);
    stroke(0);
    fill(c1); //rojo
    if (MoveT1) {
      stroke(0);
      strokeWeight(3);
    }
    translate(-(T1X+DeltaT1X+200), -(T1Y+DeltaT1Y-100));
    translate(T1X+DeltaT1X, T1Y+DeltaT1Y);
    triangle(0, 0, 400, 0, 200, -200);
    stroke(0, 0, 0);
    strokeWeight(1);
    popMatrix();

    pushMatrix();
    translate(T2X+DeltaT2X-100, T2Y+DeltaT2Y+200);
    rotate(RT2*PI/4);
    fill(c2); //verde
    if (MoveT2) {
      stroke(0);
      strokeWeight(3);
    }
    translate(-(T2X+DeltaT2X-100), -(T2Y+DeltaT2Y+200));
    translate(T2X+DeltaT2X, T2Y+DeltaT2Y);  
    triangle(0, 0, 0, 400, -200, 200);
    stroke(0, 0, 0);
    strokeWeight(1);
    popMatrix();

    pushMatrix();
    translate(T3X+DeltaT3X+50, T3Y+DeltaT3Y+50);
    rotate(RT3*PI/4);
    fill(c3); //azul
    if (MoveT3) {
      stroke(0);
      strokeWeight(3);
    }
    translate(-(T3X+DeltaT3X+50), -(T3Y+DeltaT3Y+50));
    translate(T3X+DeltaT3X, T3Y+DeltaT3Y);  
    triangle(0, 0, 0, 200, 200, 0);
    stroke(0, 0, 0);
    strokeWeight(1);
    popMatrix();

    pushMatrix();
    translate(T4X+DeltaT4X+100, T4Y+DeltaT4Y+50);
    rotate(RT4*PI/4);
    fill(c4); //amarillo
    if (MoveT4) {
      stroke(0);
      strokeWeight(3);
    }
    translate(-(T4X+DeltaT4X+100), -(T4Y+DeltaT4Y+50));
    translate(T4X+DeltaT4X, T4Y+DeltaT4Y);
    triangle(0, 0, 200, 0, 100, 100);
    stroke(0, 0, 0);
    strokeWeight(1);
    popMatrix();

    pushMatrix();
    translate(T5X+DeltaT5X+50, T5Y+DeltaT5Y-100);
    rotate(RT5*PI/4);
    fill(c5); //morado
    if (MoveT5) {
      stroke(0);
      strokeWeight(3);
    }
    translate(-(T5X+DeltaT5X+50), -(T5Y+DeltaT5Y-100));
    translate(T5X+DeltaT5X, T5Y+DeltaT5Y);
    triangle(0, 0, 0, -200, 100, -100);
    stroke(0, 0, 0);
    strokeWeight(1);
    popMatrix();

    pushMatrix();
    translate(C1X+DeltaC1X+100, C1Y+DeltaC1Y);
    rotate(RC1*PI/4);
    fill(c6);//celeste
    if (MoveC1) {
      stroke(0);
      strokeWeight(3);
    }
    translate(-(C1X+DeltaC1X+100), -(C1Y+DeltaC1Y));
    translate(C1X+DeltaC1X, C1Y+DeltaC1Y);
    quad(0, 0, 100, -100, 200, 0, 100, 100);
    stroke(0, 0, 0);
    strokeWeight(1);
    popMatrix();

    pushMatrix();
    translate(C2X+DeltaC2X+50, C2Y+DeltaC2Y-150);
    rotate(RC2*PI/4);
    fill(c7); //naranja
    if (MoveC2) {
      stroke(0);
      strokeWeight(3);
    }
    translate(-(C2X+DeltaC2X+50), -(C2Y+DeltaC2Y-150));
    translate(C2X+DeltaC2X, C2Y+DeltaC2Y);
    quad(0, 0, 0, -200, 100, -300, 100, -100);
    stroke(0, 0, 0);
    strokeWeight(1);
    popMatrix();
  }

  /*Seleccion de piezas con el mouse, 
   para  selecionar una pieza el mouse debe estar encima del color de la pieza que se quiere seleccionar, 
   debe estar presionado y la variable Move debe ser igual a 0. Si se cumple esto la pieza esta seleccionada y la variable MoveT# se hace true*/
  //Seleccion pieza 1
  if ((mousePressed==true&&(mouseButton==LEFT))&&(colorfigura==-65536)&&(Move==1||Move==0)) {
    MoveT1 = true;
    Move = 1;
  }
  //Seleccion pieza 2
  if ((mousePressed==true)&&(mouseButton==LEFT)&&(colorfigura==-16711936)&&(Move==2||Move==0)) {
    MoveT2 = true;
    Move = 2;
  }
  //Seleccion pieza 3
  if ((mousePressed==true)&&(mouseButton==LEFT)&&(colorfigura==-16776961)&&(Move==3||Move==0)) {
    MoveT3 = true;
    Move = 3;
  }
  //Seleccion pieza 4
  if ((mousePressed==true)&&(mouseButton==LEFT)&&(colorfigura==-256)&&(Move==4||Move==0)) {
    MoveT4 = true;
    Move = 4;
  }
  //Seleccion pieza 5
  if ((mousePressed==true)&&(mouseButton==LEFT)&&(colorfigura==-65281)&&(Move==5||Move==0)) {
    MoveT5 = true;
    Move = 5;
  }
  //Seleccion pieza 6
  if ((mousePressed==true)&&(mouseButton==LEFT)&&(colorfigura==-16711681)&&(Move==6||Move==0)) {
    MoveC1 = true;
    Move = 6;
  }
  //Seleccion pieza 7
  if ((mousePressed==true)&&(mouseButton==LEFT)&&(colorfigura==-35568)&&(Move==7||Move==0)) {
    MoveC2 = true;
    Move = 7;
  }
  //Movimieno de piezas, si la pieza esta seleccionada su posicion se ve modificado por la diferencia de posicion desde donde se dio click hasta donde se mueve el mouse
  if (MoveT1) {
    DeltaT1X = MouseXf-MouseXi;
    DeltaT1Y = MouseYf-MouseYi;
  } else {
    //No hacer nada
  }
  if (MoveT2) {
    DeltaT2X = MouseXf-MouseXi;
    DeltaT2Y = MouseYf-MouseYi;
  } else {
    //No hacer nada
  }
  if (MoveT3) {
    DeltaT3X = MouseXf-MouseXi;
    DeltaT3Y = MouseYf-MouseYi;
  } else {
    //No hacer nada
  }
  if (MoveT4) {
    DeltaT4X = MouseXf-MouseXi;
    DeltaT4Y = MouseYf-MouseYi;
  } else {
    //No hacer nada
  }
  if (MoveT5) {
    DeltaT5X = MouseXf-MouseXi;
    DeltaT5Y = MouseYf-MouseYi;
  } else {
    //No hacer nada
  }
  if (MoveC1) {
    DeltaC1X = MouseXf-MouseXi;
    DeltaC1Y = MouseYf-MouseYi;
  } else {
    //No hacer nada
  }
  if (MoveC2) {
    DeltaC2X = MouseXf-MouseXi;
    DeltaC2Y = MouseYf-MouseYi;
  } else {
    //No hacer nada
  }
  if (Move==0) {
    DeltaX = MouseXf-MouseXi;
    DeltaY = MouseYf-MouseYi;
  } else {
    //No hacer nada
  }
  //Aproximar piezas a posiciones multiplos de 10
  //Estas variables se definen como la diferencia de la posicion de cada figura con respecto a una posicion multiplo de 10
  DesfaceT1X = T1X%5;
  DesfaceT1Y = T1Y%5;

  DesfaceT2X = T2X%5;
  DesfaceT2Y = T2Y%5;

  DesfaceT3X = T3X%5;
  DesfaceT3Y = T3Y%5;

  DesfaceT4X = T4X%5;
  DesfaceT4Y = T4Y%5;

  DesfaceT5X = T5X%5;
  DesfaceT5Y = T5Y%5;

  DesfaceC1X = C1X%5;
  DesfaceC1Y = C1Y%5;

  DesfaceC2X = C2X%5;
  DesfaceC2Y = C2Y%5;

  //Si la pieza esta seleccionada se le resta a su posicion el desface definido anteriormente
  if (MoveT1) {
    //No hacer nada
  } else {
    T1X -= DesfaceT1X;
    T1Y -= DesfaceT1Y;
  }

  if (MoveT2) {
    //No hacer nada
  } else {
    T2X -= DesfaceT2X;
    T2Y -= DesfaceT2Y;
  }

  if (MoveT3) {
    //No hacer nada
  } else {
    T3X -= DesfaceT3X;
    T3Y -= DesfaceT3Y;
  }

  if (MoveT4) {
    //No hacer nada
  } else {
    T4X -= DesfaceT4X;
    T4Y -= DesfaceT4Y;
  }

  if (MoveT5) {
    //No hacer nada
  } else {
    T5X -= DesfaceT5X;
    T5Y -= DesfaceT5Y;
  }

  if (MoveC1) {
    //No hacer nada
  } else {
    C1X -= DesfaceC1X;
    C1Y -= DesfaceC1Y;
  }

  if (MoveC2) {
    //No hacer nada
  } else {
    C2X -= DesfaceC2X;
    C2Y -= DesfaceC2Y;
  }

  /*Dectectar que cada figura esta en la posicion correcta
   Se carga un arreglo con todos los pixeles de la pantalla y se recorre comparando cada uno con el color blanco.
   Si el color es blanco se suma 1 al contador*/
  loadPixels();
  for (int i = 0; i < (width*height); i++) {
    if (pixels[i] == White) {
      CountPixelsWhite += 1;
    }
  }

  updatePixels();
  //Imprimir mensaje de Ganaste si no hay pixeles blancos en la pantalla
  if (Nivel != 0&&Nivel!=-1) {
    if (CountPixelsWhite==0) {
      Complete = true;
      textSize(100);
      fill(0, 255, 0);
      text("¡Ganaste!", 800, 150);
    } else {
      Complete = false;
    }
  }
}
//Detecta el movimiento de la rueda y suma o resta al angulo de rotacion de cada pieza, event.getCount() toma el valor de 1 o -1 dependiendo del sentido de la rotacion
void mouseWheel(MouseEvent event) {
  if (MoveT1) {
    RT1 += event.getCount();
  }
  if (MoveT2) {
    RT2 += event.getCount();
  }
  if (MoveT3) {
    RT3 += event.getCount();
  }
  if (MoveT4) {
    RT4 += event.getCount();
  }
  if (MoveT5) {
    RT5 += event.getCount();
  }
  if (MoveC1) {
    RC1 += event.getCount();
  }
  if (MoveC2) {
    RC2 += event.getCount();
  }
}

//Esta funcion se llama cuando se presiona una tecla y permite mover y rotar las piezas con el teclado
void keyPressed() {
  //Esto permite seleccionar piezas con el teclado. Suma 1 unidad a Move cada vez que se presiona TAB
  if (key == TAB) {
    Move+=1;
  } else {
    //No hacer nada
  }
  //Dependiendo del modulo con el numero 8 (0 para ninguna pieza y 1-7 para cada pieza). Si el modulo no corresponde con la pieza su movimiento es 0
  //Selecciona la tecla 1 con el teclado
  if (Move%8==1) {
    MoveT1 = true;
  } else {
    MoveT1 = false;
  }
  //Selecciona la tecla 2 con el teclado
  if (Move%8==2) {
    MoveT2 = true;
  } else {
    MoveT2 = false;
  }
  //Selecciona la tecla 3 con el teclado
  if (Move%8==3) {
    MoveT3 = true;
  } else {
    MoveT3 = false;
  }
  //Selecciona la tecla 4 con el teclado
  if (Move%8==4) {
    MoveT4 = true;
  } else {
    MoveT4 = false;
  }
  //Selecciona la tecla 5 con el teclado
  if (Move%8==5) {
    MoveT5 = true;
  } else {
    MoveT5 = false;
  }
  //Selecciona la tecla 6 con el teclado
  if (Move%8==6) {
    MoveC1 = true;
  } else {
    MoveC1 = false;
  }
  //Selecciona la tecla 7 con el teclado
  if (Move%8==7) {
    MoveC2 = true;
  } else {
    MoveC2 = false;
  }

  //Rotar las figuras con el teclado cuando la pieza esta seleccionada, al presionar las teclas e y q suma y resta uno respectivamente a la rotacion de la figura
  //Rota la figura 1 con el teclado 
  if (MoveT1) {
    if (key == 'e') {
      RT1 +=1;
    }
    if (key == 'q') {
      RT1 -= 1;
    }
  }
  //Rota la figura 2 con el teclado
  if (MoveT2) {
    if (key == 'e') {
      RT2 +=1;
    }
    if (key == 'q') {
      RT2 -= 1;
    }
  }
  //Rota la figura 3 con el teclado
  if (MoveT3) {
    if (key == 'e') {
      RT3 +=1;
    }
    if (key == 'q') {
      RT3 -= 1;
    }
  }
  //Rota la figura 4 con el teclado
  if (MoveT4) {
    if (key == 'e') {
      RT4 +=1;
    }
    if (key == 'q') {
      RT4 -= 1;
    }
  }
  //Rota la figura 5 con el teclado
  if (MoveT5) {
    if (key == 'e') {
      RT5 +=1;
    }
    if (key == 'q') {
      RT5 -= 1;
    }
  }
  //Rota la figura 6 con el teclado
  if (MoveC1) {
    if (key == 'e') {
      RC1 +=1;
    }
    if (key == 'q') {
      RC1 -= 1;
    }
  }
  //Rota la figura 7 con el teclado
  if (MoveC2) {
    if (key == 'e') {
      RC2 +=1;
    }
    if (key == 'q') {
      RC2 -= 1;
    }
  }
  //Mover las figuras con el teclado, al presionar las teclas indicadas (w,a,s,d) suma o resta 10 unidades en el eje x o y
  //Mueve la figura 1 con el teclado
  if (MoveT1) {
    if (key == 'd') {
      T1X += 5;
    }
    if (key == 'a') {
      T1X -= 5;
    }
    if (key == 's') {
      T1Y += 5;
    }
    if (key == 'w') {
      T1Y -= 5;
    }
  }
  //Mueve la figura 2 con el teclado
  if (MoveT2) {
    if (key == 'd') {
      T2X += 5;
    }
    if (key == 'a') {
      T2X -= 5;
    }
    if (key == 's') {
      T2Y += 5;
    }
    if (key == 'w') {
      T2Y -= 5;
    }
  }
  //Mueve la figura 3 con el teclado
  if (MoveT3) {
    if (key == 'd') {
      T3X += 5;
    }
    if (key == 'a') {
      T3X -= 5;
    }
    if (key == 's') {
      T3Y += 5;
    }
    if (key == 'w') {
      T3Y -= 5;
    }
  }
  //Mueve la figura 4 con el teclado
  if (MoveT4) {
    if (key == 'd') {
      T4X += 5;
    }
    if (key == 'a') {
      T4X -= 5;
    }
    if (key == 's') {
      T4Y += 5;
    }
    if (key == 'w') {
      T4Y -= 5;
    }
  }
  //Mueve la figura 5 con el teclado
  if (MoveT5) {
    if (key == 'd') {
      T5X += 5;
    }
    if (key == 'a') {
      T5X -= 5;
    }
    if (key == 's') {
      T5Y += 5;
    }
    if (key == 'w') {
      T5Y -= 5;
    }
  }
  //Mueve la figura 6 con el teclado
  if (MoveC1) {
    if (key == 'd') {
      C1X += 5;
    }
    if (key == 'a') {
      C1X -= 5;
    }
    if (key == 's') {
      C1Y += 5;
    }
    if (key == 'w') {
      C1Y -= 5;
    }
  }
  //Mueve la figura 7 con el teclado
  if (MoveC2) {
    if (key == 'd') {
      C2X += 5;
    }
    if (key == 'a') {
      C2X -= 5;
    }
    if (key == 's') {
      C2Y += 5;
    }
    if (key == 'w') {
      C2Y -= 5;
    }
  }
}