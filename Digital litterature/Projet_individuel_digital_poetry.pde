// Listes de mots utilisables
String[] nouns = {
  "heart", "soul", "starlight", "ocean", "whisper", 
  "shadow", "garden", "spirit", "dream", "silence", 
  "flower", "river", "dawn", "dusk", "breath"
};
String[] adjectives = {
  "eternal", "golden", "silent", "sweet", "tender", 
  "faint", "bright", "wild", "deep", "serene", 
  "infinite", "fragile", "distant", "pure", "vibrant"
};
String[] adverbs = {
  "softly", "always", "slowly", "forever", "quietly", 
  "deeply", "brightly", "gently", "wildly", "calmly", 
  "nearly", "suddenly", "longingly", "tenderly", "lightly"
};
String[] verbs = {
  "blooms", "fades", "shines", "flows", "dances", 
  "breathes", "wanders", "sings", "glows", "trembles", 
  "lingers", "waits", "awakes", "follows", "sleeps"
};

// Haiku : 3 phrases
String[] poem = new String[3];

// Mots sélectionnables par l'utilisateur
String[] extraWords = new String[23];
// Coordonnées de ceux-ci (idée ChatGPT pour faciliter la manipulation des mots)
float[] cardX = new float[23];
float[] cardY = new float[23];

void setup() {
  size(800, 800);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  
  // Haiku central
  poem[0] = "A " + choice(adjectives) + " " + choice(nouns) + ",";
  poem[1] = choice(adverbs) + " " + choice(verbs) + ",";
  poem[2] = "and " + choice(verbs) + " a " + choice(nouns) + ".";
  
  // Paramètres des cercles : centrés au milieu de l'image
  float centerX = width/2;
  float centerY = height/2;
  
  for (int i = 0; i < 23; i++) {
    // On remplit la liste des mots mis à disposition
    if (i == 0) extraWords[i] = "And";
    else if (i == 1) extraWords[i] = "A";
    else if (i == 2) extraWords[i] = "The";
    else if (i < 8) extraWords[i] = choice(nouns);
    else if (i < 13) extraWords[i] = choice(adjectives);
    else if (i < 18) extraWords[i] = choice(verbs);
    else extraWords[i] = choice(adverbs);

    // Répartition en deux cercles concentriques
    float angle = 0;
    float radius = 0;
    
    if (i < 10) { 
      // Premier cercle (10 premiers mots)
      angle = map(i, 0, 10, 0, TWO_PI);
      radius = 200; 
    } else { 
      // Deuxième cercle (les 13 suivants)
      angle = map(i, 10, 23, 0, TWO_PI);
      radius = 350; 
    }
    
    // Conversion polaire (coordonnées dans les cercles) -> cartésien (dans le plan de l'image)
    cardX[i] = centerX + cos(angle) * radius;
    cardY[i] = centerY + sin(angle) * radius;
  }
}

//Pour le drag and drop
int draggedIndex = -1; // Index du mot que l'on traîne (-1 = aucun)
float opacity = 255;

void draw() {  
  // Dégradé de bleu en fond
  for (int y = 0; y < height; y++) {
    float inter = map(y, 0, height, 0, 1);
    
    int c2 = color(210, 230, 255);   // bleu ciel très clair
    int c1 = color(150, 175, 230);   // bleu lavande pastel plus marqué
  
    int c = lerpColor(c1, c2, inter); // Ligne par ligne, on passe de c1 à c2 progressivement
    stroke(c);
    line(0, y, width, y);
  }

  textSize(17);
  
  // Affichage de l'haiku
  // On réduit l'opacité après le lancement
  opacity = map(millis(), 0, 15000, 255, 0); 
  opacity = constrain(opacity, 0, 255); // On force l'opacité à ne pas descendre sous 0

  for (int i = 0; i < poem.length; i++) {
    // Dégradé de gris : effet esthétique
    fill(i * 80, opacity); 
    text(poem[i], width/2, height/2 + (i * 25));
  }
  
  // Pour le drag : si on a cliqué sur un mot, la souris le suit
  if (draggedIndex != -1) {
    cardX[draggedIndex] = mouseX;
    cardY[draggedIndex] = mouseY;
  }
  
  // Dessiner la boîte des mots de l'utilisateur
  for (int i = 0; i < extraWords.length; i++) {
    fill(240, 240, 255);
    stroke(200);
    rect(cardX[i], cardY[i], 80, 30); // Boîte
    
    if (cardY[i]>height/2) {
      fill(160);
      text(extraWords[i], cardX[i], cardY[i]); // Texte
    }
    else {
      fill(0);
      text(extraWords[i], cardX[i], cardY[i]); // Texte
    }
  }
}


void mousePressed() {
  // On cherche si on clique sur un mot
  for (int i = 0; i < extraWords.length; i++) {
    if (dist(mouseX, mouseY, cardX[i], cardY[i]) < 30) {
      draggedIndex = i; // Index du mot sélectionné
      break; 
    }
  }
}

void mouseReleased() {
  draggedIndex = -1;
}

void keyPressed() {
  if (key == ' ') {
    // Régénérer tous les mots
    for (int i = 0; i < 23; i++) {
      if (i == 0) extraWords[i] = "And";
      else if (i == 1) extraWords[i] = "A";
      else if (i == 2) extraWords[i] = "The";
      else if (i < 8) extraWords[i] = choice(nouns);
      else if (i < 13) extraWords[i] = choice(adjectives);
      else if (i < 18) extraWords[i] = choice(verbs);
      else extraWords[i] = choice(adverbs);
    }
  }
}


// Fonction qui choisit aléatoirement un mot dans une liste de mots (cf Love Letters)
String choice(String[] list) {
  return list[int(random(list.length))];
}
