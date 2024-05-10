# Mini jeu dans le terminal

## Overview

Ce mini jeu permet de faire un morpion avec un ami.

## Get started

````sh
bundler install # installer les dépendances
ruby app.rb #faire une partie
````

## Arborescence

````sh
/lib
    /player.rb #création des joueurs
    /board.rb #création du board et méthodes pour mettre à jour le board
    /boardcase.rb #création d'un array pour créer les cases du morpion
    /game.rb #création de la partie + éxecution de méthodes pour le déroulement de la partie
    /show.rb #montrer le board en grille
/Gemfile #les dépendances
/app.rb #executer le programme
````
