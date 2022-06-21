---
layout: post
title: Solving Battleship
github: David-Carlson/Battleship
tags: [python, ai]
excerpt_separator: <!--more-->
previous-research: https://david-carlson.github.io/wip/box-proximity
---
A Battleship playing script I wrote for fun. It generates random Battleship starting locations and then systematically seeks them out! [Play it online here](https://replit.com/@Sylvernale/Battleship#main.py:89:8)

<!--more-->

I was inspired by one of my favorite programming related websites - [Data Genetics](https://datagenetics.com/blog/december32011/index.html), which describes on a high level a system of alternately *Hunting* for ships until you hit one, then *Targeting* the ship until it sinks. 

## Hunting Mode
This code consists primarily of *counting*. It takes each ship that hasn't sunk yet and tries to place it in every possible position across the board. If I shot at a cell and it missed, then a ship cannot be placed in any position overlapping a miss marker. It also cannot overlap a sunk ship. The result is that for each cell I have a number representing how many ships can be fit across the cell, which I interpret as a likelihood. I take just the most likely positions and throw out the rest. I then randomly choose among the most likely and shoot. This process repeats indefinitely until I hit a ship and go into *targeting mode*.  


<!-- Update repl Publish link -->
<!-- Update Github readme -->