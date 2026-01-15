import java.util.Random;

Random rand = new Random();

// Liste de mots
String[] first = {"Fool", "Jerk", "Silly", "Clown"};
String[] second = {"idiot", "person", "moron", "stranger"};

String[] adjectives = {
  "annoying","bothersome","irritating","unpleasant","pesky","troublesome",
  "grating","nasty","disagreeable","off-putting","mean","spiteful",
  "unfriendly","cold","resentful","unwelcome","petty","moody",
  "vexing","displeasing","unlikable","testy","cantankerous","critical",
  "grouchy","grumpy","obnoxious","snappy","irksome","cross"
};

String[] nouns = {
  "annoyance","irritation","frustration","displeasure","resentment","grudge",
  "distaste","disdain","mild hatred","unhappiness","conflict","tension",
  "bitterness","disagreement","resentment","spite","grumpiness","trouble",
  "friction","grouchiness","unfriendliness","petty quarrel","antipathy",
  "discomfort","awkwardness","resentment","dissatisfaction","unpleasantness",
  "objection","resentment"
};

String[] adverbs = {
  "annoyingly","bothersomely","irritatingly","unpleasantly","grumpily","coldly",
  "pettily","spitefully","gratingly","resentfully","crossly","testily",
  "snappily","grouchily","critically","obnoxiously","displeasingly","vexingly",
  "moodyly","mildly","unfriendly","awkwardly","cantankerously","uncomfortably",
  "irksomely","distastefully","troublesomely","resentfully","unwelcomely","disdainfully"
};

String[] verbs = {
  "annoys","bothers","irritates","disturbs","displeases","frustrates",
  "grates on","upsets","provokes","angers","buggs","troubles",
  "disagrees with","rebukes","criticizes","snaps at","rejects","avoids",
  "dismisses","scorns","grumbles at","frowns on","spites","mocks",
  "rebuffs","provokes mildly","chafes","vexes","disturbs slightly","dislikes"
};


void setup() {
  noLoop();
  println(""); // Ligne vide au début pour plus d'esthétisme

  while (true) {
    println(letter());
    delay(12000);   // 12 secondes
  }
}

// Fonction qui choisit aléatoirement un mot dans une liste de mots
String choice(String[] list) {
  return list[int(random(list.length))];
}

// Fonction maybe
String maybe(String[] words) {
  if (rand.nextBoolean()) { // Pile ou face pour choisir entre une phrase longue ou courte
    return ' ' + choice(words);
  }
  return " ";
}

// Fonction de phrases longues
String longer() {
    return (
        " My"
        + maybe(adjectives)
        + ' '
        + choice(nouns)
        + maybe(adverbs)
        + ' '
        + choice(verbs)
        + " your"
        + maybe(adjectives)
        + ' '
        + choice(nouns)
        + '.'
    );
}

// Fonctions pour phrases courtes
String shorter() {
    return ' ' + choice(adjectives) + ' ' + choice(nouns) + '.';
}

// Corps de la lettre
String body() {
    String text = "";
    boolean you_are = false;
    
    for (int i = 0; i<6; i++) {

        if (rand.nextBoolean()) { // Pile ou face pour choisir
            text += longer(); // Phrase longue
            you_are = false;
        }
        else {
            if (you_are) {
                text = text.substring(0, text.length()-1); // text[:-1] en Python
                text += ": my" + shorter();
                you_are = false;
            }
            else {
                text += " You are my" + shorter();
                you_are = true;
            }
        }
    }
    return text;
};

// Formatage du texte (ChatGPT)
String wrapText(String text, int maxWidth) { // Affichage de 80 caractères par lignes
  String[] words = text.split(" "); // On découpe le texte en mots individuels
  String result = "";
  int lineLength = 0;

  for (String w : words) { // On parcourt le tableau de mots
    if (lineLength + w.length() > maxWidth) { // On vérifie si la ligne a plus de 80 caractères
      result += "\n"; // Si oui, on revient à la ligne
      lineLength = 0;
    }
    result += w + " "; // On ajoute le nouveau mot
    lineLength += w.length() + 1;
  }
  return result.trim(); // On renvoit le texte formaté
}

// Lettre complète
String letter() {
    String text = choice(first) + " " + choice(second) + "\n\n"
           + wrapText(body(), 80) + "\n\n"
           + "                                  Yours " + choice(adverbs) + "\n\n"
           + "                                  M.U.C.\n";
           
    return text;
}
