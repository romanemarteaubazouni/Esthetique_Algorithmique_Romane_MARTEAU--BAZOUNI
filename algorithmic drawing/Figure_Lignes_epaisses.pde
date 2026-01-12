float offset = 0;

void setup() {
  size(640,400);
  background(250, 250, 250);
}

void draw() {
 int n = 0;
 int x = 640;
 int y = 400;
 
 for (int d = 1; n<y && d<100; d++) { //"&& d<100" remplace le "pause 100"
  n=n+d+1;
  // on change l'épaisseur de la ligne
  strokeWeight(d);
  //on change la couleur de la ligne
  float couleur=(n+offset)%255;
  stroke(couleur, 100, 200);
  x=x-d-10;
  y=y-d-10;
  // on trace chaque ligne du rectangle, d'un coin à un autre
  line(n, n, n, y);
  line(n, y, x, y);
  line(x, y, x, n);
  line(x, n, n, n);
 }
 offset += 1;
}
