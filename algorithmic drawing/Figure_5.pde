void setup() {
  size(800,800);
  background(250, 250, 250);
}

void draw() {
 int A = 400; // car Xsl = 800
 int B = 400;
 
 //on suit le code du support de cours
 for (int I = 1; I<11; I++) {
  float R = 400*0.7;
  for (float W = PI/4; W<3.6; W+=0.05) {
    float X=R*cos(W);
    float Y=R*sin(W);
    line(A+X,B-Y,A-Y,B-X);
    line(A-Y,B-X,A-X,B+X);
    line(A-X,B+Y,A+X,B-Y);
    line(A-X,B+Y,A+Y,B+X);
    line(A+X,B+X,A+X,B-Y);
    R=R*0.94;
  }
 }
}
// la 2e boucle n'a pas été réalisée puisqu'elle ne décale que la figure et cela allège le code
