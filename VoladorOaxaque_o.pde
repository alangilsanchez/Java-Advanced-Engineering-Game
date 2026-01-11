class Vidas{
    float x, y;
    boolean activo;

    void asigna(float x, float y) { //Cordenadas y variable para saber si no lo ha atrapado el jugador
        this.x = x;
        this.y = y;
        this.activo = true;
    }

    void mostrar() {
        if (activo) { //Si esta activo dibuja el circulo
            fill(255, 0, 0); // Rojo puro
            //circle(x, y, 50); // Dibuja el circulo
            image(vidasExtra,x,y);
        }
    }

    void mover(float velocidad) {
        y += velocidad;
    }

    void atrapado() {
        activo = false;
    }
    

    boolean sigueActivo() {
        return activo;
    }
}

class Municiones{
    float x, y;
    boolean activo;

    void asigna(float x, float y) { //Cordenadas y variable para saber si no lo ha atrapado el jugador
        this.x = x;
        this.y = y;
        this.activo = true;
    }

    void mostrar() {
        if (activo) { //Si esta activo dibuja el circulo
            fill(255, 215, 0); // Dorado 
            //circle(x, y, 50); // Dibuja el circulo
            image(municionExtra,x,y);
        }
    }

    void mover(float velocidad) {
        y += velocidad;
    }

    void atrapado() {
        activo = false;
    }
    

    boolean sigueActivo() {
        return activo;
    }
}

class Boton{
  
  int x, y, ancho;//atributos de la clase
  
  void asigna(int _x, int _y){ //metodo asigna
    
    x=_x;
    y=_y;
    ancho = width/7;
  }
  
  void dibuja(){ //metodo dibuja
    fill(255);
    rect(x,y,ancho,ancho/2);
    
  
  }
  
  void cambiaColor(){
    
    fill(0);
    rect(x,y,ancho,ancho/2);
    
  }

}
class Arbol {
    float x, y; // Coordenadas del árbol
    int direccion; //Variable para la direccion del arbol

    Arbol(float x, float y, int direccion) {
        this.x = x;
        this.y = y;
        this .direccion = direccion;
    }

    void mostrar() {
        fill(0, 255, 0);
        //rect(x, y, 200, 100); // Dibuja el árbol
        if(direccion==0){
          image(iArbol,x,y);
        }else if(direccion==1){
          image(dArbol,x,y);
        }
        
    }

    void mover(float velocidad) {
        y += velocidad;
    }
    
    void reinicio() {
        this.y = 0;
    }

    boolean fueraDePantalla() {
        return y > height; 
    }
}


class Duende {
    float x, y;
    boolean vivo;
    int direccion; //Variable para la direccion del duende

    Duende(float x, float y,int direc) { //Cordenadas y variable para saber si esta vivo
        this.x = x;
        this.y = y;
        this.vivo = true;
        direccion = direc;
    }

    void mostrar() {
        if (vivo) { //Si esta vivo dibuja al duende
            //fill(144, 238, 144); 
            //circle(x, y, 100); // Dibuja al duende
            if(direccion==0){
              image(iDuende,x,y);
            }else if(direccion==1){
              image(dDuende,x,y);
            }
        }
    }

    void mover(float velocidad) {
        y += velocidad;
    }

    void matar() {
        vivo = false;
    }
    
    void reinicio() {
        this.y = -100;
        vivo = true;
    }


    boolean estaVivo() {
        return vivo;
    }
}

class Bala {
  float x, y, xObjetivo, yObjetivo;
  float Cx, Cy, hipotenusa;

  Bala(float xInicio, float yInicio, float xObjetivo, float yObjetivo) { //Inicializamos la ubicación de la bala y su objetivo
    this.x = xInicio;
    this.y = yInicio;
    this.xObjetivo = xObjetivo;
    this.yObjetivo = yObjetivo;
    Cx = xObjetivo - xInicio;
    Cy = yObjetivo - yInicio;
    hipotenusa = sqrt(sq(Cx) + sq(Cy)); //Distancia entre la bala y el objetivo
  }

  void mover() {
    x += (Cx / hipotenusa) * 10; //movemos la bala en el eje "x" y "y" de forma proporcional
    y += (Cy / hipotenusa) * 10;
  }

  void mostrar() {
    fill(0, 0, 0);
    circle(x, y, 30);   //Pinta la bala
  }

  boolean salio() { //Si la bala esta fuera del marco
    return (x < 20 || x > 980 || y < 20 || y > 980);
  }
}

class BalaDuende {
    float x, y, xObjetivo, yObjetivo;
    float Cx, Cy, hipotenusa;
    int direccion=0; //Izquierda o derecha
    int flecha=0; //angulo

    BalaDuende(float xInicio, float yInicio, float xObjetivo, float yObjetivo) {
        this.x = xInicio;
        this.y = yInicio;
        this.xObjetivo = xObjetivo;
        this.yObjetivo = yObjetivo;
        Cx = xObjetivo - xInicio;
        Cy = yObjetivo - yInicio;
        hipotenusa = sqrt(sq(Cx) + sq(Cy));
        if(x==100){
          direccion=0;
        }else if(x==850){
          direccion=1;
        }
        
        if(direccion==0){
          if(y<=300){
            flecha=1; //Flecha izquierda hacia abajo
            
          }else if(y>300 && y<400){
            flecha=2; //Flecha izquierda hacia el centro
            
          }else if(y>=400){
            flecha = 3; //Flecha izquierda hacia arriba
            
          }
        }
        
        if(direccion==1){
          if(y<=300){
            flecha=4; //Flecha derecha hacia abajo
            
          }else if(y>300 && y<400){
            flecha=5; //Flecha derecha hacia el centro
            
          }else if(y>=400){
            flecha=6; //Flecha derecha hacia arriba
            
          }
        }
    }

    void mover() {
        x += (Cx / hipotenusa) * 5; // Velocidad de la bala
        y += (Cy / hipotenusa) * 5;
    }

    void mostrar() {
        fill(255, 0, 0);
        //circle(x, y, 20); // Bala más pequeña
         
        switch(flecha){
          case 1:
            //image(iAFlecha,x,y);
             image(iFlecha,x,y);
            break;
          case 2:
            image(iFlecha,x,y);
            break;
          case 3:
            //image(iAbFlecha,x,y);
             image(iFlecha,x,y);
            break;
          case 4:
            //image(dAFlecha,x,y);
            image(dFlecha,x,y);
            break;
          case 5:
            image(dFlecha,x,y);
            break;
          case 6:
            //image(dAbFlecha,x,y);
            image(dFlecha,x,y);
            break;
        }
        
    }

    boolean salio() {
        return (x < 0 || x > width || y < 0 || y > height);
    }
}

//Fuente
PFont fuente;
PFont fuente2;

//IMAGENES
PImage nube;
PImage dHelias13;
PImage iHelias13;
PImage dHelias12;
PImage iHelias12;
PImage dHelias11;
PImage iHelias11;
PImage dHelias10;
PImage iHelias10;
PImage dHelias9;
PImage iHelias9;
PImage dHelias8;
PImage iHelias8;
PImage dHelias7;
PImage iHelias7;
PImage dHelias6;
PImage iHelias6;
PImage dHelias5;
PImage iHelias5;
PImage dHelias4;
PImage iHelias4;
PImage dHelias3;
PImage iHelias3;
PImage dHelias2;
PImage iHelias2;
PImage dHelias1;
PImage iHelias1;
PImage iArbol;
PImage dArbol;
PImage iDuende;
PImage dDuende;
PImage iAbFlecha;
PImage iAFlecha;
PImage iFlecha;
PImage dAbFlecha;
PImage dAFlecha;
PImage dFlecha;
PImage vidasExtra;
PImage municionExtra;
PImage fondo;
PImage fondoVictoria;

ArrayList<Bala> balas = new ArrayList<>(); //Lista de las balas
ArrayList<BalaDuende> balasDuendes = new ArrayList<>(); //Lista de las balas de los duendes
ArrayList<Arbol> arboles = new ArrayList<>(); //Lista de los arboles
ArrayList<Duende> duendes = new ArrayList<>(); //Lista de los duendes

Boton jugar = new Boton(); //Boton para iniciar el juego
Boton salir = new Boton(); //Boton para salir del juego
Vidas masVidas = new Vidas(); //Potenciador que añade vidas
Municiones masMunicion = new Municiones(); //Potenciador que añade municion

boolean inicia=false; //Variable para dar comienzo al juego
int opcion = 1; //1 para menu, 2 para jugar y el 3 para fin del juego

int nubeY=0, nube2Y=0;
int numNube=1;
int xHelias=500; //Posicion inicial en X de Helias
int yHelias=450; //Posicion inicial en Y de Helias
int vidas = 10; // Vidas de Helias
int puntos = 0; //puntaje por partida
int municion = 10; //munición disponible
int distancia=50; //Varible para la distancia entre las balas de los duendes y Helias
float probabilidad = 0.005; //probabilidad de disparo de los duendes
int ultimoMultiplo = 0; //Varibale para registrar el ultimo multiplo de 1000
int aumentoVidas = 0; //Variable para aumentar vidas
int aumentoMunicion = 0; //Variable para aumentar municion
boolean mostrarVida=false; //Variable para saber cuando mostrar el potenciador de vidas
boolean mostrarMunicion=false; //Variable para saber cuando mostrar el potenciador de municion
int direccion=0; //variable para cambiar la imagen de Helias segun su dirección




void setup(){//inicializar variables 
  size(1000, 700);  //tamaño de pantalla
  
  jugar.asigna(720,400); //Asigna las coordenadas de los botones
  salir.asigna(720,500);
  
  masVidas.asigna(700,0);//Asigna la posicion de donde aparecera el poder de mas vidas
  masMunicion.asigna(400,0);//Asigna la posicion de donde aparecera el poder de mas municion
  
  
  nube = loadImage("nube.png");
  nube.resize(250,100);
  
  vidasExtra = loadImage("vidaExtra.png");
  vidasExtra.resize(55,55);
  
  municionExtra = loadImage("municionExtra.png");
  municionExtra.resize(55,55);
  
  iArbol = loadImage("iArbol.png");
  iArbol.resize(250,170);
  
  dArbol = loadImage("dArbol.png");
  dArbol.resize(250,170);
  
  dDuende = loadImage("dDuende.png");
  dDuende.resize(150,150);
  
  iDuende = loadImage("iDuende.png");
  iDuende.resize(150,150);
  
  iAbFlecha = loadImage("iabFlecha.png");
  iAbFlecha.resize(50,80);
  
  iAFlecha = loadImage("iaFlecha.png");
  iAFlecha.resize(50,80);
  
  iFlecha = loadImage("iFlecha.png");
  iFlecha.resize(55,20);
  
  dAbFlecha = loadImage("dabFlecha.png");
  dAbFlecha.resize(50,80);
  
  dAFlecha = loadImage("daFlecha.png");
  dAFlecha.resize(50,80);
  
  dFlecha = loadImage("dFlecha.png");
  dFlecha.resize(55,20);
  
  dHelias13 = loadImage("dHelias13.png");
  dHelias13.resize(200,250);
  
  iHelias13 = loadImage("iHelias13.png");
  iHelias13.resize(200,250);
  
  dHelias12 = loadImage("dHelias12.png");
  dHelias12.resize(200,250);
  
  iHelias12 = loadImage("iHelias12.png");
  iHelias12.resize(200,250);
  
  dHelias11 = loadImage("dHelias11.png");
  dHelias11.resize(200,250);
  
  iHelias11 = loadImage("iHelias11.png");
  iHelias11.resize(200,250);
  
  dHelias10 = loadImage("dHelias10.png");
  dHelias10.resize(200,250);
  
  iHelias10 = loadImage("iHelias10.png");
  iHelias10.resize(200,250);
  
  dHelias9 = loadImage("dHelias9.png");
  dHelias9.resize(200,250);
  
  iHelias9 = loadImage("iHelias9.png");
  iHelias9.resize(200,250);
  
  dHelias8 = loadImage("dHelias8.png");
  dHelias8.resize(200,250);
  
  iHelias8 = loadImage("iHelias8.png");
  iHelias8.resize(200,250);
  
  dHelias7 = loadImage("dHelias7.png");
  dHelias7.resize(200,250);
  
  iHelias7 = loadImage("iHelias7.png");
  iHelias7.resize(200,250);
  
  dHelias6 = loadImage("dHelias6.png");
  dHelias6.resize(200,250);
  
  iHelias6 = loadImage("iHelias6.png");
  iHelias6.resize(200,250);
  
  dHelias5 = loadImage("dHelias5.png");
  dHelias5.resize(200,250);
  
  iHelias5 = loadImage("iHelias5.png");
  iHelias5.resize(200,250);
  
  dHelias4 = loadImage("dHelias4.png");
  dHelias4.resize(200,250);
  
  iHelias4 = loadImage("iHelias4.png");
  iHelias4.resize(200,250);
  
  dHelias3 = loadImage("dHelias3.png");
  dHelias3.resize(200,250);
  
  iHelias3 = loadImage("iHelias3.png");
  iHelias3.resize(200,250);
  
  dHelias2 = loadImage("dHelias2.png");
  dHelias2.resize(200,250);
  
  iHelias2 = loadImage("iHelias2.png");
  iHelias2.resize(200,250);
  
  dHelias1 = loadImage("dHelias1.png");
  dHelias1.resize(200,250);
  
  iHelias1 = loadImage("iHelias1.png");
  iHelias1.resize(200,250);
  
  fondo = loadImage("Oaxaca.PNG");
  fondo.resize(1000,700);
  
  fondoVictoria = loadImage("victoria.PNG");
  fondoVictoria.resize(1000,700);
 
  
   // Inicializar árboles y duendes
   arboles.add(new Arbol(0, 0,0));     // Árbol izquierdo
   arboles.add(new Arbol(750, -300,1));  // Árbol derecho
   duendes.add(new Duende(100, -100,0)); // Duende izquierdo
   duendes.add(new Duende(850, -400,1)); // Duende derecho
   
   
   fuente = loadFont("AdobeGothicStd-Bold-48.vlw"); //Arial en negrita
   fuente2 = createFont("MexicanTequila.ttf",90); //Arial en negrita
      
}

void draw(){
  if(opcion==1){
    background(144, 238, 144); // Color verde claro
    image(fondo,0,0);
    jugar.dibuja();
    salir.dibuja();
    
    fill(0);//cambiar color
    textFont(fuente);
    textSize(20);
    text("JUGAR", 760, 445);
    text("SALIR", 764, 545);
    textFont(fuente2);
    text("VOLADOR OAXAQUENO",55, 145);
    
    if(mouseX>=jugar.x && mouseY>=jugar.y && mouseX <=jugar.x+jugar.ancho && mouseY<=jugar.y+jugar.ancho/2){
      jugar.cambiaColor();
      fill(255);//cambiar color
      textSize(30);
      text("JUGAR", 750, 445);
    }
    if(mouseX>=salir.x && mouseY>=salir.y && mouseX <=salir.x+salir.ancho && mouseY<=salir.y+salir.ancho/2){
      //salir.cambiaColor();
      salir.cambiaColor();
      fill(255);//cambiar color
      textSize(30);
      text("SALIR", 750, 545);
    }
  }else if(opcion==2){
    background(135,206,235);//escala de grises background, color azul cielo
    fill(255, 255, 255);//cambiar color del circulo
    
    //NUBES
    image(nube,260,nubeY);
    
    if(nubeY==350){
      numNube=2;
      nube2Y=0;
     }
     if(numNube==2){
       image(nube,600,nube2Y);
       nube2Y+=1;
     }
     if(nube2Y==350){
       nubeY=0;
     }
     nubeY+=1;
     
     
     switch(vidas){
       case 1:
         if(direccion==0)
          image(dHelias1,xHelias,yHelias);
         else
           image(iHelias1,xHelias,yHelias);
         break;
       case 2:
         if(direccion==0)
          image(dHelias2,xHelias,yHelias);
         else
           image(iHelias2,xHelias,yHelias);
         break;
       case 3:
         if(direccion==0)
          image(dHelias3,xHelias,yHelias);
         else
           image(iHelias3,xHelias,yHelias);
         break;
       case 4:
         if(direccion==0)
          image(dHelias4,xHelias,yHelias);
         else
           image(iHelias4,xHelias,yHelias);
         break;
       case 5:
         if(direccion==0)
          image(dHelias5,xHelias,yHelias);
         else
           image(iHelias5,xHelias,yHelias);
         break;
       case 6:
         if(direccion==0)
          image(dHelias6,xHelias,yHelias);
         else
           image(iHelias6,xHelias,yHelias);
         break;
       case 7:
         if(direccion==0)
          image(dHelias7,xHelias,yHelias);
         else
           image(iHelias7,xHelias,yHelias);
         break;
       case 8:
         if(direccion==0)
          image(dHelias8,xHelias,yHelias);
         else
           image(iHelias8,xHelias,yHelias);
         break;
       case 9:
         if(direccion==0)
          image(dHelias9,xHelias,yHelias);
         else
           image(iHelias9,xHelias,yHelias);
         break;
       case 10:
         if(direccion==0)
          image(dHelias10,xHelias,yHelias);
         else
           image(iHelias10,xHelias,yHelias);
         break;
       case 11:
         if(direccion==0)
          image(dHelias11,xHelias,yHelias);
         else
           image(iHelias11,xHelias,yHelias);
         break;
       case 12:
         if(direccion==0)
          image(dHelias12,xHelias,yHelias);
         else
           image(iHelias12,xHelias,yHelias);
         break;
       case 13:
         if(direccion==0)
          image(dHelias13,xHelias,yHelias);
         else
           image(iHelias13,xHelias,yHelias);
         break;
       
     }
     
     
    //HELIAS 
    /*
    fill(255, 255, 0); //cambiar color del circulo
    //circle(xHelias, yHelias, 100);
    if(direccion==0)
      image(dHelias,xHelias,yHelias);
    else
      image(iHelias,xHelias,yHelias);
    */
    if (puntos >= ultimoMultiplo + 500) {//Cada 500 puntos aumenta la probabilidad de disparo
        probabilidad += 0.002; // Aumenta la probabilidad
        //probabilidad += 100; // Aumenta la probabilidad
        ultimoMultiplo += 1000; // Actualiza el último múltiplo alcanzado
    }
    // Mostrar y mover árboles
      for (Arbol arbol : arboles) {
          arbol.mostrar();
          arbol.mover(2);
      }
      
  
      // Mostrar y mover duendes
      for (Duende duende : duendes) {
        if(duende.estaVivo()){
          duende.mostrar();
          duende.mover(2);
          
          if (random(1) < probabilidad) { // Probabilidad de disparo
            balasDuendes.add(new BalaDuende(duende.x, duende.y, xHelias, yHelias));
          }
        }
          
      }
  
      // Reiniciar árboles y duendes si salen de la pantalla
      for (Arbol arbol : arboles) {
          if(arbol.fueraDePantalla()){
            arbol.reinicio();
            for (Duende duende : duendes) {
              if(duende.x == arbol.x+100){
                duende.reinicio();
                puntos+=100;
              }    
            }  
          }
      }
      
       
  
      // Mostrar vidas restantes, puntaje y municion
      fill(0);
      textFont(fuente);
      textSize(20);
      text("Vidas: " + vidas, 20, 30);
      text("Municion: " + municion, 20, 50);
      //text("Probabilidad: " + probabilidad, 20, 50);
      text("Puntaje: " + puntos, 880, 30);
      
  
    //Balas
    for (int i = balas.size() - 1; i >= 0; i--) {
      Bala bala = balas.get(i);
      bala.mover();
      bala.mostrar();
  
      if (bala.salio()) {
          balas.remove(i); // Elimino la bala si está fuera de la pantalla
          continue;
      }
  
      // Colisiones con los duendes
      for (int j = duendes.size() - 1; j >= 0; j--) {
        Duende duende = duendes.get(j);
          
        if (duende.estaVivo() && dist(bala.x, bala.y, duende.x, duende.y ) < 100) {
          duende.matar(); // Matar al duende
          balas.remove(i); // Elimina la bala
          break; 
        }
      }
    }
    
    if (puntos >= aumentoVidas + 200) {//Cada 1000 aparecera un circulo cayendo que nos dara mas vida
        aumentoVidas += 200; // Actualiza el último múltiplo alcanzado
        mostrarVida=true;
        masVidas.asigna(700,0);//Asigna la posicion de donde aparecera el poder de mas vidas
        
    }
    
    if (puntos >= aumentoMunicion + 100) {//Cada 500 aparecera un circulo cayendo que nos dara mas municion
        aumentoMunicion += 100; // Actualiza el último múltiplo alcanzado
        mostrarMunicion=true;
        masMunicion.asigna(300,0);//Asigna la posicion de donde aparecera el poder de mas municion
    }
    
    if(mostrarVida==true){
        masVidas.mostrar();
        masVidas.mover(4);
        
        if (masVidas.sigueActivo() && dist(xHelias+100, yHelias+100, masVidas.x, masVidas.y ) < 50) {
          masVidas.atrapado(); // Atrapo el potenciador
          if(vidas==12){
            vidas+=1;
          }else if(vidas<12){
            vidas+=2;
          }
          
        }
    }
    
    if(mostrarMunicion==true){
        masMunicion.mostrar();
        masMunicion.mover(4);
        
        if (masMunicion.sigueActivo() && dist(xHelias+100, yHelias+100, masMunicion.x, masMunicion.y ) < 50) {
          masMunicion.atrapado(); // Atrapo el potenciador
          municion+=5;
        }
    }
    
    //Balas de los duendes
      for (int i = balasDuendes.size() - 1; i >= 0; i--) {
          BalaDuende bala = balasDuendes.get(i);
          bala.mover();
          bala.mostrar();
  
          if (bala.salio()) {
              balasDuendes.remove(i); // Elimina balas fuera de la pantalla
              continue;
          }
  
          // Colisión con Helias
          
          if(vidas==1){
            distancia=1;
          }
          if(vidas<=3 && vidas>1){
            distancia=25;
          }
         else{
           distancia=50;
         }
          if (dist(bala.x, bala.y, xHelias, yHelias) < distancia) {
              vidas--; // Reducir vidas
              balasDuendes.remove(i); // Elimina bala que impactó a Helias
              if (vidas <= 0) {
                //inicia=false;
                opcion=1; //Juego terminado
                  //println("¡Juego terminado!");
                  //noLoop(); // Detener el juego
              }
          }
      }
      
      if(puntos>1500){
        opcion=3;
      }
  
  }else if(opcion==3){
    image(fondoVictoria,0,0);
    jugar.dibuja();
    salir.dibuja();
    
    fill(0);//cambiar color
    textFont(fuente);
    textSize(18);
    text("VOLVER A JUGAR", 720, 445);
    textSize(18);
    text("SALIR", 764, 545);
    
    if(mouseX>=jugar.x && mouseY>=jugar.y && mouseX <=jugar.x+jugar.ancho && mouseY<=jugar.y+jugar.ancho/2){
      jugar.cambiaColor();
      fill(255);//cambiar color
      textSize(18);
      text("VOLVER A JUGAR", 720, 445);
    }
    if(mouseX>=salir.x && mouseY>=salir.y && mouseX <=salir.x+salir.ancho && mouseY<=salir.y+salir.ancho/2){
      //salir.cambiaColor();
      salir.cambiaColor();
      fill(255);//cambiar color
      textSize(30);
      text("SALIR", 750, 545);
    }
  }
  
}

void keyPressed(){  
  if (keyCode == RIGHT) {
    direccion=0;
    if (xHelias < 600) {
      xHelias += 10;
    }
  }
  if (keyCode == LEFT) {
    direccion=1;
    if (xHelias > 200) {
      xHelias -= 10;
    }
  }
  if (keyCode == UP) {
    if (yHelias > 300) {
      yHelias -= 10;
    }
  }
  if (keyCode == DOWN) {
    if (yHelias < 450) {
      yHelias += 10;
    }
  }
    
}

void mouseClicked(){  
  if(opcion==1 || opcion==3){
    if(mouseX>=jugar.x && mouseY>=jugar.y && mouseX <=jugar.x+jugar.ancho && mouseY<=jugar.y+jugar.ancho/2){
      opcion=2; //Comienza el juego
      
      //Reinicio de valores
      nubeY=0;
      nube2Y=0;
      numNube=1;
      xHelias=500; //Posicion inicial en X de Helias
      yHelias=450; //Posicion inicial en Y de Helias
      vidas = 10; // Vidas de Helias
      puntos = 0; //puntaje por partida
      municion = 10; //munición disponible
      distancia=50; //Varible para la distancia entre las balas de los duendes y Helias
      probabilidad = 0.005; //probabilidad de disparo de los duendes
      ultimoMultiplo = 0; //Varibale para registrar el ultimo multiplo de 1000
      aumentoVidas = 0; //Variable para aumentar vidas
      aumentoMunicion = 0; //Variable para aumentar municion
      mostrarVida=false; //Variable para saber cuando mostrar el potenciador de vidas
      mostrarMunicion=false; //Variable para saber cuando mostrar el potenciador de municion
      direccion=0; //variable para cambiar la imagen de Helias segun su dirección
      
      //Balas
      for (int i = balas.size() - 1; i >= 0; i--) {
        balas.remove(i); // Elimino la bala si está fuera de la pantalla
      }
      
      //Balas
      for (int i = balasDuendes.size() - 1; i >= 0; i--) {
        balasDuendes.remove(i); // Elimino la bala si está fuera de la pantalla
      }
      
      for (int i = arboles.size() - 1; i >= 0; i--) {
        arboles.remove(i); // Elimino la bala si está fuera de la pantalla
      }
      
      for (int i = duendes.size() - 1; i >= 0; i--) {
        duendes.remove(i); // Elimino la bala si está fuera de la pantalla
      }
      
      // Inicializar árboles y duendes
       arboles.add(new Arbol(0, 0,0));     // Árbol izquierdo
       arboles.add(new Arbol(750, -300,1));  // Árbol derecho
       duendes.add(new Duende(100, -100,0)); // Duende izquierdo
       duendes.add(new Duende(850, -400,1)); // Duende derecho
          
          
      
    } 
    if(mouseX>=salir.x && mouseY>=salir.y && mouseX <=salir.x+salir.ancho && mouseY<=salir.y+salir.ancho/2){
      //salir
      exit();
    }
  }else if(opcion==2){
    if(municion > 0){
      Bala nuevaBala = new Bala(xHelias, yHelias+200, mouseX, mouseY); // Nueva bala
      balas.add(nuevaBala); 
      municion -=1;
    }
    
  }
  
}
