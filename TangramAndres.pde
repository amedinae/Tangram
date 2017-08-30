//Posicion de figuras
//T significa triangulo y C cuadrilatero
color Blanco = color(255, 255, 255);
int CountPixels;

int T1X = 20;
int T1Y = 620;

int T2X = 610;
int T2Y = 10;

int T3X = 990;
int T3Y = 20;

int T4X = 990;
int T4Y = 250;

int T5X = 450;
int T5Y = 630;

int C1X = 980;
int C1Y = 460;

int C2X = 690;
int C2Y = 580;

int MouseXi;
int MouseYi;

int MouseXf;
int MouseYf;

int DeltaT1X;
int DeltaT1Y;

int DeltaT2X;
int DeltaT2Y;

int DeltaT3X;
int DeltaT3Y;

int DeltaT4X;
int DeltaT4Y;

int DeltaT5X;
int DeltaT5Y;

int DeltaC1X;
int DeltaC1Y;

int DeltaC2X;
int DeltaC2Y;

boolean click = true;

//Desface de figuras

int DesfaceT1X;
int DesfaceT1Y;

int DesfaceT2X;
int DesfaceT2Y;

int DesfaceT3X;
int DesfaceT3Y;

int DesfaceT4X;
int DesfaceT4Y;

int DesfaceT5X;
int DesfaceT5Y;

int DesfaceC1X;
int DesfaceC1Y;

int DesfaceC2X;
int DesfaceC2Y;

//Rotacion de figuras
float RT1 = 0;
float RT2 = 0;
float RT3 = 0;
float RT4 = 0;
float RT5 = 0;
float RC1 = 0;
float RC2 = 0;

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
boolean MoveMouseT1;
boolean MoveMouseT2;
boolean MoveMouseT3;
boolean MoveMouseT4;
boolean MoveMouseT5;
boolean MoveMouseC1;
boolean MoveMouseC2;
int Move = 0;/*Evita mover varias piezas a la vez, el valor por defecto es 0 que significa que no se esta moviendo ninguna pieza. 
 Una pieza solo se puede mover cuando Move es igual a 0 o Move es igual al numero de la pieza
 */
boolean MoveTecladoT1;
boolean MoveTecladoT2;
boolean MoveTecladoT3;
boolean MoveTecladoT4;
boolean MoveTecladoT5;
boolean MoveTecladoC1;
boolean MoveTecladoC2;

//Se inicia el programa con un zona de trabajo de 1000x1000 pixeles
void setup() {
  size(1300, 650);
}
//Esta funcion regresa el valor de las variables de movimiento a su valor por defecto
void mouseReleased() {
  MoveMouseT1 = false;
  MoveMouseT2 = false;
  MoveMouseT3 = false;
  MoveMouseT4 = false;
  MoveMouseT5 = false;
  MoveMouseC1 = false;
  MoveMouseC2 = false;
  Move = 0;

  click = true;

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

void mouseDragged() {
  click = false;
  MouseXf = mouseX;
  MouseYf = mouseY;
}

//Esta funcion permmite mover y rotar las piezas con el teclado
void keyPressed() {
  //Esto permite seleccionar piezas con el teclado
  if (key == TAB) {
    Move+=1;
  }
  //Selecciona la tecla 1 con el teclado
  if (Move%8==1) {
    MoveTecladoT1 = true;
  } else {
    MoveTecladoT1 = false;
  }
  //Selecciona la tecla 2 con el teclado
  if (Move%8==2) {
    MoveTecladoT2 = true;
  } else {
    MoveTecladoT2 = false;
  }
  //Selecciona la tecla 3 con el teclado
  if (Move%8==3) {
    MoveTecladoT3 = true;
  } else {
    MoveTecladoT3 = false;
  }
  //Selecciona la tecla 4 con el teclado
  if (Move%8==4) {
    MoveTecladoT4 = true;
  } else {
    MoveTecladoT4 = false;
  }
  //Selecciona la tecla 5 con el teclado
  if (Move%8==5) {
    MoveTecladoT5 = true;
  } else {
    MoveTecladoT5 = false;
  }
  //Selecciona la tecla 6 con el teclado
  if (Move%8==6) {
    MoveTecladoC1 = true;
  } else {
    MoveTecladoC1 = false;
  }
  //Selecciona la tecla 7 con el teclado
  if (Move%8==7) {
    MoveTecladoC2 = true;
  } else {
    MoveTecladoC2 = false;
  }

  //Rota la figura 1 con el teclado
  if (MoveTecladoT1||MoveMouseT1) {
    if (keyPressed) {
      if (key == 'e') {
        RT1 +=1;
      }
      if (key == 'q') {
        RT1 -= 1;
      }
    }
  }
  //Mueve la figura 1 con el teclado
  if (MoveTecladoT1) {
    if (keyPressed) {
      if (key == 'd') {
        T1X += 10;
      }
      if (key == 'a') {
        T1X -= 10;
      }
      if (key == 's') {
        T1Y += 10;
      }
      if (key == 'w') {
        T1Y -= 10;
      }
    }
  }
  //Rota la figura 2 con el teclado
  if (MoveTecladoT2||MoveMouseT2) {
    if (keyPressed) {
      if (key == 'e') {
        RT2 +=1;
      }
      if (key == 'q') {
        RT2 -= 1;
      }
    }
  }
  //Mueve la figura 2 con el teclado
  if (MoveTecladoT2) {
    if (keyPressed) {
      if (key == 'd') {
        T2X += 10;
      }
      if (key == 'a') {
        T2X -= 10;
      }
      if (key == 's') {
        T2Y += 10;
      }
      if (key == 'w') {
        T2Y -= 10;
      }
    }
  }
  //Rota la figura 3 con el teclado
  if (MoveTecladoT3||MoveMouseT3) {
    if (keyPressed) {
      if (key == 'e') {
        RT3 +=1;
      }
      if (key == 'q') {
        RT3 -= 1;
      }
    }
  }
  //Mueve la figura 3 con el teclado
  if (MoveTecladoT3) {
    if (keyPressed) {
      if (key == 'd') {
        T3X += 10;
      }
      if (key == 'a') {
        T3X -= 10;
      }
      if (key == 's') {
        T3Y += 10;
      }
      if (key == 'w') {
        T3Y -= 10;
      }
    }
  }
  //Rota la figura 4 con el teclado
  if (MoveTecladoT4||MoveMouseT4) {
    if (keyPressed) {
      if (key == 'e') {
        RT4 +=1;
      }
      if (key == 'q') {
        RT4 -= 1;
      }
    }
  }
  //Mueve la figura 4 con el teclado
  if (MoveTecladoT4) {
    if (keyPressed) {
      if (key == 'd') {
        T4X += 10;
      }
      if (key == 'a') {
        T4X -= 10;
      }
      if (key == 's') {
        T4Y += 10;
      }
      if (key == 'w') {
        T4Y -= 10;
      }
    }
  }
  //Rota la figura 5 con el teclado
  if (MoveTecladoT5||MoveMouseT5) {
    if (keyPressed) {
      if (key == 'e') {
        RT5 +=1;
      }
      if (key == 'q') {
        RT5 -= 1;
      }
    }
  }
  //Mueve la figura 5 con el teclado
  if (MoveTecladoT5) {
    if (keyPressed) {
      if (key == 'd') {
        T5X += 10;
      }
      if (key == 'a') {
        T5X -= 10;
      }
      if (key == 's') {
        T5Y += 10;
      }
      if (key == 'w') {
        T5Y -= 10;
      }
    }
  }

  //Rota la figura 6 con el teclado
  if (MoveTecladoC1||MoveMouseC1) {
    if (keyPressed) {
      if (key == 'e') {
        RC1 +=1;
      }
      if (key == 'q') {
        RC1 -= 1;
      }
    }
  }
  //Mueve la figura 6 con el teclado
  if (MoveTecladoC1) {
    if (keyPressed) {
      if (key == 'd') {
        C1X += 10;
      }
      if (key == 'a') {
        C1X -= 10;
      }
      if (key == 's') {
        C1Y += 10;
      }
      if (key == 'w') {
        C1Y -= 10;
      }
    }
  }
  //Rota la figura 7 con el teclado
  if (MoveTecladoC2||MoveMouseC2) {
    if (keyPressed) {
      if (key == 'e') {
        RC2 +=1;
      }
      if (key == 'q') {
        RC2 -= 1;
      }
    }
  }
  //Mueve la figura 7 con el teclado
  if (MoveTecladoC2) {
    if (keyPressed) {
      if (key == 'd') {
        C2X += 10;
      }
      if (key == 'a') {
        C2X -= 10;
      }
      if (key == 's') {
        C2Y += 10;
      }
      if (key == 'w') {
        C2Y -= 10;
      }
    }
  }
}

void mousePressed() {
  if (click) {
    MouseXi = mouseX;
    MouseYi = mouseY;
  }
}

//Dentro de la funcion Draw el codigo se ejecuta constantemente
void draw() {
  CountPixels = 0;
 
  color colorfigura = get(mouseX, mouseY); //Obtiene el color del pixel donde se encuentra el mouse

  background(179, 040, 033);

  //Marco del tangram
  fill(255);
  rect(10, 10, 400, 400);

  //Piezas
  pushMatrix();
  translate(T1X+DeltaT1X, T1Y+DeltaT1Y);
  rotate(RT1*PI/4);
  fill(c1); //rojo
  if (MoveMouseT1||MoveTecladoT1) {
    stroke(0);
    strokeWeight(3);
  }
  triangle(0, 0, 400, 0, 200, -200);
  stroke(0, 0, 0);
  strokeWeight(1);
  popMatrix();

  pushMatrix();
  translate(T2X+DeltaT2X, T2Y+DeltaT2Y);
  rotate(RT2*PI/4);
  fill(c2); //verde
  if (MoveMouseT2||MoveTecladoT2) {
    stroke(0);
    strokeWeight(3);
  }
  triangle(0, 0, 0, 400, -200, 200);
  stroke(0, 0, 0);
  strokeWeight(1);
  popMatrix();

  pushMatrix();
  translate(T3X+DeltaT3X, T3Y+DeltaT3Y);
  rotate(RT3*PI/4);
  fill(c3); //azul
  if (MoveMouseT3||MoveTecladoT3) {
    stroke(0);
    strokeWeight(3);
  }
  triangle(0, 0, 0, 200, 200, 0);
  stroke(0, 0, 0);
  strokeWeight(1);
  popMatrix();

  pushMatrix();
  translate(T4X+DeltaT4X, T4Y+DeltaT4Y);
  rotate(RT4*PI/4);
  fill(c4); //amarillo
  if (MoveMouseT4||MoveTecladoT4) {
    stroke(0);
    strokeWeight(3);
  }
  triangle(0, 0, 200, 0, 100, 100);
  stroke(0, 0, 0);
  strokeWeight(1);
  popMatrix();

  pushMatrix();
  translate(T5X+DeltaT5X, T5Y+DeltaT5Y);
  rotate(RT5*PI/4);
  fill(c5); //morado
  if (MoveMouseT5||MoveTecladoT5) {
    stroke(0);
    strokeWeight(3);
  }
  triangle(0, 0, 0, -200, 100, -100);
  stroke(0, 0, 0);
  strokeWeight(1);
  popMatrix();

  pushMatrix();
  translate(C1X+DeltaC1X, C1Y+DeltaC1Y);
  rotate(RC1*PI/4);
  fill(c6);//celeste
  if (MoveMouseC1||MoveTecladoC1) {
    stroke(0);
    strokeWeight(3);
  }
  quad(0, 0, 100, -100, 200, 0, 100, 100);
  stroke(0, 0, 0);
  strokeWeight(1);
  popMatrix();

  pushMatrix();
  translate(C2X+DeltaC2X, C2Y+DeltaC2Y);
  rotate(RC2*PI/2);
  fill(c7); //naranja
  if (MoveMouseC2||MoveTecladoC2) {
    stroke(0);
    strokeWeight(3);
  }
  quad(0, 0, 0, -200, 100, -300, 100, -100);
  stroke(0, 0, 0);
  strokeWeight(1);
  popMatrix();
  println(DeltaT1X);
  println(DeltaT1Y);

  //Movimiento de piezas
  //Movimiento pieza 1
  if ((mousePressed==true&&(mouseButton==LEFT))&&(colorfigura==-65536)&&(Move==1||Move==0)) {
    MoveMouseT1 = true;
    Move = 1;
  }
  if (MoveMouseT1) {
    DeltaT1X = MouseXf-MouseXi;
    DeltaT1Y = MouseYf-MouseYi;
  }
  //Movimiento pieza 2
  if ((mousePressed==true&&(mouseButton==LEFT))&&(colorfigura==-16711936)&&(Move==2||Move==0)) {
    MoveMouseT2 = true;
    Move = 2;
  }
  if (MoveMouseT2) {
    DeltaT2X = MouseXf-MouseXi;
    DeltaT2Y = MouseYf-MouseYi;
  }
  //Movimiento pieza 3
  if ((mousePressed==true&&(mouseButton==LEFT))&&(colorfigura==-16776961)&&(Move==3||Move==0)) {
    MoveMouseT3 = true;
    Move = 3;
  }
  if (MoveMouseT3) {
    DeltaT3X = MouseXf-MouseXi;
    DeltaT3Y = MouseYf-MouseYi;
  }
  //Movimiento pieza 4
  if ((mousePressed==true&&(mouseButton==LEFT))&&(colorfigura==-256)&&(Move==4||Move==0)) {
    MoveMouseT4 = true;
    Move = 4;
  }
  if (MoveMouseT4) {
    DeltaT4X = MouseXf-MouseXi;
    DeltaT4Y = MouseYf-MouseYi;
  }
  //Movimiento pieza 5
  if ((mousePressed==true&&(mouseButton==LEFT))&&(colorfigura==-65281)&&(Move==5||Move==0)) {
    MoveMouseT5 = true;
    Move = 5;
  }
  if (MoveMouseT5) {
    DeltaT5X = MouseXf-MouseXi;
    DeltaT5Y = MouseYf-MouseYi;
  }
  //Movimiento pieza 6
  if ((mousePressed==true&&(mouseButton==LEFT))&&(colorfigura==-16711681)&&(Move==6||Move==0)) {
    MoveMouseC1 = true;
    Move = 6;
  }
  if (MoveMouseC1) {
    DeltaC1X = MouseXf-MouseXi;
    DeltaC1Y = MouseYf-MouseYi;
  }
  //Movimiento pieza 7
  if ((mousePressed==true&&(mouseButton==LEFT))&&(colorfigura==-35568)&&(Move==7||Move==0)) {
    MoveMouseC2 = true;
    Move = 7;
  }
  if (MoveMouseC2) {
    DeltaC2X = MouseXf-MouseXi;
    DeltaC2Y = MouseYf-MouseYi;
  }

  DesfaceT1X = T1X%10;
  DesfaceT1Y = T1Y%10;

  DesfaceT2X = T2X%10;
  DesfaceT2Y = T2Y%10;

  DesfaceT3X = T3X%10;
  DesfaceT3Y = T3Y%10;

  DesfaceT4X = T4X%10;
  DesfaceT4Y = T4Y%10;

  DesfaceT5X = T5X%10;
  DesfaceT5Y = T5Y%10;

  DesfaceC1X = C1X%10;
  DesfaceC1Y = C1Y%10;

  DesfaceC2X = C2X%10;
  DesfaceC2Y = C2Y%10;

  if (MoveMouseT1||MoveTecladoT1) {
  } else {
    T1X -= DesfaceT1X;
    T1Y -= DesfaceT1Y;
  }

  if (MoveMouseT1||MoveTecladoT1) {
  } else {
    T2X -= DesfaceT2X;
    T2Y -= DesfaceT2Y;
  }

  if (MoveMouseT1||MoveTecladoT1) {
  } else {
    T3X -= DesfaceT3X;
    T3Y -= DesfaceT3Y;
  }

  if (MoveMouseT1||MoveTecladoT1) {
  } else {
    T4X -= DesfaceT4X;
    T4Y -= DesfaceT4Y;
  }

  if (MoveMouseT1||MoveTecladoT1) {
  } else {
    T5X -= DesfaceT5X;
    T5Y -= DesfaceT5Y;
  }

  if (MoveMouseT1||MoveTecladoT1) {
  } else {
    C1X -= DesfaceC1X;
    C1Y -= DesfaceC1Y;
  }

  if (MoveMouseT1||MoveTecladoT1) {
  } else {
    C2X -= DesfaceC2X;
    C2Y -= DesfaceC2Y;
  }
  //Rotacion de figuras

  //Dectectar que cada figura esta en la posicion correcta
  loadPixels();
  for (int i = 0; i < (width*height); i++) {
    if (pixels[i] == Blanco) {
      CountPixels += 1;
    }
  }
  updatePixels();
 println(CountPixels);
  //Imprimir mensaje de Ganaste
  if (CountPixels<100) {
    textSize(50);
    fill(255);
    text("Ganaste", 700, 200);
  }
}
//Detecta el movimiento de la rueda y suma o resta al angulo de rotacion de cada piez
void mouseWheel(MouseEvent event) {
  if (MoveMouseT1) {
    RT1 += event.getCount();
  }
  if (MoveMouseT2) {
    RT2 += event.getCount();
  }
  if (MoveMouseT3) {
    RT3 += event.getCount();
  }
  if (MoveMouseT4) {
    RT4 += event.getCount();
  }
  if (MoveMouseT5) {
    RT5 += event.getCount();
  }
  if (MoveMouseC1) {
    RC1 += event.getCount();
  }
  if (MoveMouseC2) {
    RC2 += event.getCount();
  }
}