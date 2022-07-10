---
layout: post
title: Solving Battleship
github: David-Carlson/Battleship
tags: [python, ai]
legend:
  - link: /img/blog/battleship/initial-board.png
    alt: A display showing the program's view of the board, the actual state, and the probabilities of ships being in a given cell
    caption: Playing field shows hits as X, misses as O, and sunk ships as shaded blocks. 
targeting:
  - link: /img/blog/battleship/targeting-ships.png
    alt: Targeting mode showing the hits, misses, and where the program wants to aim next, either left or right of the hits
    caption: Given two hits right next to each other the algorithm views the cells above/below as not likely and instead targets the left and right sides with equal likelihood 
rect-graph:
  - link: /img/blog/battleship/initial-board.png
    alt: Plotting a normal rectangle now
    caption: All points directly inside rectangle
  - link: /img/blog/battleship/targeting-ships.png
    alt: Plotting a rotated rectangle
    caption: Plotting points near rotated Rectangle
excerpt_separator: <!--more-->
---
A Battleship playing script I wrote for fun. It generates random Battleship starting locations and then systematically seeks them out! [Play it online here](https://replit.com/@Sylvernale/Battleship#main.py:89:8)


<!--more-->

I was inspired by one of my favorite programming related websites - [Data Genetics](https://datagenetics.com/blog/december32011/index.html), which describes on a high level a system of alternately *Hunting* for ships until you hit one, then *Targeting* the ship until it sinks.

{% include image-grid.html image-set=page.legend class="col-xs-12" %}
{% include image-grid.html image-set=page.rect-graph class="col-xs-12" %}

## Hunting Mode
This code consists primarily of *counting*. It takes each ship that hasn't sunk yet and tries to place it in every possible position across the board. If I shot at a cell and it missed, then a ship cannot be placed in any position overlapping a miss marker. It also cannot overlap a sunk ship. The result is that for each cell I have a number representing how many ships can be fit across the cell, which I interpret as a likelihood. I take just the most likely positions and throw out the rest. I then randomly choose among the most likely and shoot. This process repeats indefinitely until I hit a ship and go into *targeting mode*.  

## Targeting Mode
Once a new ship is hit every subsequent hit goes to tracking the ship down until it is sunk. This works by adding the neighbors of the hit cell to a list. I then weight this list based on the likelihood of a ship being placed across the board. Once I fully sink a ship I return to Hunting mode until all ships are sunk. 

{% include image-grid.html image-set=page.targeting class="col-xs-12" %}

## Optimizations & Techniques
While in hunting mode, it isn't necessary to search every cell. For instance, every ship is at least 2 cells long - this means that I can ignore half the board (like shooting white tiles on a chessboard) since once I hit one part of a ship on a 'white' cell, I can find the others. I can extend this logic further by adjusting for the shortest remaining ship left. If the shortest ship is 5 cells long the pattern is searching the diagonal of every 5x5 block of cells and ignoring the others until targeting mode kicks in. 

{% include image-grid.html image-set=page.basis2 class="col-xs-12" %}


  


<!-- Update repl Publish link -->
<!-- Update Github readme -->