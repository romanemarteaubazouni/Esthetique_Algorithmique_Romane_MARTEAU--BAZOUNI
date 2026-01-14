// Ce code est une version plus optimale qui n'affiche pas chauqe pixel un par un. Cependant, Processing présente un problème d'affichage lorsqu'on lance ce code.
// Ce problème persiste.

// On limite le nombre d'itération sur chaque pixel
int max_iter = 200;

// Critère de Julia
float re_c;
float im_c;

// Borne du rectangle d'affichage
float xmin = -1.5;
float xmax = 1.5;
float ymin = -1.5;
float ymax = 1.5;

void setup() {
  size(800, 800);
  colorMode(HSB, 255);
  background(0);
}

void draw(){
  loadPixels();
  float t = frameCount * 0.01; // Inclusion d'une variable temporelle
  re_c = 0.7 * cos(t);      // Oscillations (0.7 : valeurs expérimentales pour esthétisme)
  im_c = 0.7 * sin(t);
  
  int iterate;
  
  for (int i = 0 ; i<width; i++) {
    for (int j = 0; j<height; j++) {
      
      float re_z = map(i, 0, width, xmin, xmax); // z = complexe représentant chaque pixel
      float im_z = map(j, 0, height, ymin, ymax);
      
      iterate = 0;
      
      while (re_z*re_z + im_z*im_z <= 4 && iterate < max_iter) { // Tant qu'il n'y a pas divergence de |z|
      // Itération sur les parties imaginaires et réelles : z(n+1) = z(n)²+c
      // Nécessité de nouvelles variables : le calcul de newIm_z utilise re_z. Ainsi, il ne doit être changé qu'ultérieurement
        float newRe_z = re_z*re_z - im_z*im_z + re_c;
        float newIm_z = 2*re_z*im_z + im_c;
        
        re_z = newRe_z;
        im_z = newIm_z;
        
        iterate+=1;
      }
      
      if (iterate < max_iter) {
        float col = map(iterate, 0, max_iter, 150, 200); // Couleur : teinte de violet
        float sat = map(iterate, 0, max_iter, 50, 200); // Saturation
        float bright = map(iterate, 0, max_iter, 150, 200); // Luminance
        pixels[j*width + i] = color(col, sat, bright);
      }
      else {
        pixels[j*width + i] = color(0, 0, 0); // Pixels qui ne divergent jamais restent noirs
      }
    }
  }
  updatePixels();
}
