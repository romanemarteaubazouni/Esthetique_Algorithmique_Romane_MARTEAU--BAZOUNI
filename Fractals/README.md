# Fractals

Pour tester le code, installer Processing et exécuter les fichiers .pde.

## Matinée : Exemples de codes de génération de fractales
Les fractales qui m'intéressent le plus sont les fractales de Julia. Cela m'intéraissait de faire un code assez mathématique et de comprendre les calculs sur les complexes de ce genre de fractale.
En parcourant des références et des cours, j'ai décidé de prendre le critère de Julia suivant : -0.8 + i*0.2
![alt text](./Screenshots/Ensemble_fractales_de_Julia.png)

L'idée est de coder après avoir compis tout l'aspect mathématique pour générer une image esthétique (dans la forme et dans les couleurs). Un aspect dynamique sera peut-être ajouté ultérieurement.

## Après-midi : Suite du projet personnel
Le code, qui ne marchait pas avant la pause midi, a été retouché.

![alt text](./Screenshots/Projet_individuel_N&B.png)

Pour dynamiser la structure, j'ai choisi de faire varier le critère de Julia (c) au cours du temps. 

La fractale a été initialement réalisée en nuance de gris. C'est ma préférée. Deux versions ont été réalisées. Une version non optimale, avec un affichage pixel par pixel qui n'est pas dans ce dossier, et une version plus optimale.

Enfin, j'ai souhaité ajouté de la couleur, ce qui m'a beaucoup posé problème. J'ai fait le choix d'utiliser le code optimisé de la version N&B. Le rendu couleur me plait moins que celui en N&B, mais cela donne un effet trou noir que j'apprécie.

## Crédits
### IA :
ChatGPT a été utilisé pour ce code. *Rien n'a été généré par IA*. Tous les caluls mathématiques (l. 25, l. 31...) ont été posés par mes soins. Cependant, j'ai utilisé de l'IA pour :
- l'utilisation des complexes dans Processing. Je cherchais une fonction complex() ou quelque chose du genre, idé abandonnée pour finaleemnt maic=puler les parties imaginaires et réelles.

- optimisation du code : au lieu d'afficher pixel par pixel, utilisation de loadPixels(). Cependant, problème d'affichage que je n'ai pas réussi à régler.

### Cours en ligne et articles :
- https://mytino.itch.io/fractal-explorer : ispiration de certains codes disponibles ;

- https://math.univ-cotedazur.fr/~gachet/teaching/Fractales.pdf ;

- Blog "SuperProf"