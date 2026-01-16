# Fractals

Pour tester le code, installer Processing et exécuter les fichiers .pde.

## Matinée : Exemples de codes de génération de fractales
Les fractales qui m’intéressent le plus sont les fractales de Julia. J’avais envie d’écrire un code assez mathématique et de mieux comprendre les calculs sur les nombres complexes nécessaires à ce type de fractales.
En parcourant des références et des cours, j'ai décidé de prendre le critère de Julia suivant : -0.8 + i*0.2
![alt text](./Screenshots/Ensemble_fractales_de_Julia.png)

Mon objectif était d’assimiler toute la partie mathématique pour ensuite générer une image esthétique, tant dans la forme que dans les couleurs. Un aspect dynamique pourra peut-être être ajouté plus tard, pour apporter une dimension intéressante, particulièrement pour du mapping.

## Après-midi : Suite du projet personnel
Le code, qui ne marchait pas avant la pause midi, a été retouché.

![alt text](./Screenshots/Projet_individuel_N&B.png)

Pour dynamiser la structure, j'ai choisi de faire varier le critère de Julia (c) au cours du temps. 

La première version a été réalisée en niveaux de gris. C’est celle que je préfère. J’en ai développé deux versions : une première, non optimale, affichant l’image pixel par pixel (et qui n’est pas présente dans ce dossier), puis une version plus optimisée.

Ensuite, j’ai souhaité ajouter de la couleur, ce qui m’a posé davantage de difficultés. J’ai conservé la logique optimisée de la version N&B. Le rendu me touche moins par son esthétisme mais plus par son potentiel en mapping vidéo (projection sur façades). Je suis convaincue que ce type de visuels, notamment en couleur qui ajoute un aspect "trou noir", peut avoir un fort pouvoir émotionnel lorsqu’il est projeté à grande échelle.

## Crédits
### IA :
ChatGPT a été utilisé pour ce code. *Rien n'a été généré par IA*. Tous les caluls mathématiques (l. 25, l. 31...) ont été posés par mes soins. Cependant, j'ai utilisé de l'IA pour :

- l'utilisation des complexes dans Processing. Je cherchais une fonction complex() ou quelque chose du genre, idée abandonnée pour finaleemnt manipuler les parties imaginaires et réelles ;

- optimisation du code : au lieu d'afficher pixel par pixel, utilisation de loadPixels().

### Cours en ligne et articles :
- https://mytino.itch.io/fractal-explorer : ispiration de certains codes disponibles ;

- https://math.univ-cotedazur.fr/~gachet/teaching/Fractales.pdf ;

- Blog "SuperProf"