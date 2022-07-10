---
layout: post
title: Solving Battleship
image: /img/blog/box-proximity/icon.jpg
github: David-Carlson/Battleship
tags: [python, ai]
excerpt_separator: <!--more-->
board-images:
  - link: /img/blog/battleship/initial-board.png
    alt: A display showing the program's view of the board, the actual state, and the probabilities of ships being in a given cell
    caption: Playing field shows hits as X, misses as O, and sunk ships as shaded blocks. 
  - link: /img/blog/battleship/targeting-ships.png
    alt: Targeting mode showing the hits, misses, and where the program wants to aim next, either left or right of the hits
    caption: Given two hits right next to each other the algorithm views the cells above/below as not likely and instead targets the left and right sides with equal likelihood 
initial-board:
  - link: /img/blog/battleship/initial-board.png
    alt: A display showing the program's view of the board, the actual state, and the probabilities of ships being in a given cell
    caption: Playing field shows hits as X, misses as O, and sunk ships as shaded blocks. 
targeting:
  - link: /img/blog/battleship/targeting-ships.png
    alt: Targeting mode showing the hits, misses, and where the program wants to aim next, either left or right of the hits
    caption: Given two hits right next to each other the algorithm views the cells above/below as not likely and instead targets the left and right sides with equal likelihood 
basis1:
  - link: /img/blog/box-proximity/latex/basis1.png
    alt: Change of base from rect coordinates to global
basis2:
  - link: /img/blog/box-proximity/latex/basis2.png
    alt: Change of base from global to rect coordinates
---
<!-- TODO: Add image and inline images above -->
<!-- Add latex and/or SVG graphics
https://www.janvas.com/v6.1/janvas_web_6.1/en/howto.php
-->

A Battleship playing script I wrote for fun. It generates random Battleship starting locations and then systematically seeks them out! [Play it online here](https://replit.com/@Sylvernale/Battleship#main.py:89:8)
<!--more-->
I was inspired by one of my favorite programming related websites - [Data Genetics](https://datagenetics.com/blog/december32011/index.html), which describes on a high level a system of alternately *Hunting* for ships until you hit one, then *Targeting* the ship until it sinks.

{% include image-grid2.html image-set=page.board-images class="col-sm-6 col-xs-12" %}

{% include image-grid2.html image-set=page.initial-board class="col-sm-6 col-xs-12" %}

{% include image-grid2.html image-set=page.targeting class="col-sm-6 col-xs-12" %}

## Hunting Mode
This code consists primarily of *counting*. It takes each ship that hasn't sunk yet and tries to place it in every possible position across the board. If I shot at a cell and it missed, then a ship cannot be placed in any position overlapping a miss marker. It also cannot overlap a sunk ship. The result is that for each cell I have a number representing how many ships can be fit across the cell, which I interpret as a likelihood. I take just the most likely positions and throw out the rest. I then randomly choose among the most likely and shoot. This process repeats indefinitely until I hit a ship and go into *targeting mode*.  

## Targeting Mode
Once a new ship is hit every subsequent hit goes to tracking the ship down until it is sunk. This works by adding the neighbors of the hit cell to a list. I then weight this list based on the likelihood of a ship being placed across the board. Once I fully sink a ship I return to Hunting mode until all ships are sunk. 

<!-- {% include image-grid.html image-set=page.targeting class="col-xs-12" %} -->

## Optimizations & Techniques
While in hunting mode, it isn't necessary to search every cell. For instance, every ship is at least 2 cells long - this means that I can ignore half the board (like shooting white tiles on a chessboard) since once I hit one part of a ship on a 'white' cell, I can find the others. I can extend this logic further by adjusting for the shortest remaining ship left. If the shortest ship is 5 cells long the pattern is searching the diagonal of every 5x5 block of cells and ignoring the others until targeting mode kicks in. 

{% include image-grid.html image-set=page.basis2 class="col-xs-12" %}


  




## Initial Thoughts
The rectangle is described by center position, dimensions, and the local X and Y axes
which describe rotation. For no rotation, these are `(1,0)` and `(0,1)` respectively.
A 45 degree rotation is represented by `(1,1)`, `(-1,1)` for localX and localY.


Immediately, I considered distance equations involving points and lines.
Naively, I could test the point to see if it's within all 4 line segments of the
rectangle, and if it isn't, find the distance to the edges and corners.
This seemed unwieldy so I considered the fact that the problem is simpler if the
rectangle is not rotated and is centered at origin. Thus I set out rewind the rectangle's
transformations by applying them in reverse to the point
(e.g if the rect was rotated 10 degrees CCW, rotate the point 10 CW).
I found this transformation by finding the change of basis matrix, which,
simply enough, is just the column vectors of the rectangle's local X and Y axes.
{% include image-grid.html image-set=page.basis1 class="col-xs-12" %}
<!-- R = localX,y -->
Reversing this is as simple as inverting the matrix and applying it.
{% include image-grid.html image-set=page.basis2 class="col-xs-12" %}
<!-- Draw latex matrix -->
<!-- Picture showing rect transformation -->
<!-- Latex of matrices used -->
<!-- Link to resources used -->
After finding the point relative to the rectangle, I took the absolute value of
the point's coordinates. If the point was (-20,-10), the distance is the same as
if it were (20,10). This greatly simplifies the logic. The rest of the code is
testing whether the point is inside, to the right, above, or right & above,
of the rectangle. Finding the distance in each case is trivial.


Great, so the initial plots look correct for a normal rectangles. My plan to
visualize it worked it, meaning I can see many results at once. The third picture
shows the points close to an infinitely small rectangle. As predicted, it's a circle.
Lastly, I tried changing the rectangle's axes so they weren't 90 degrees from
each other. This results in a parallelogram, as seen in the last image. Success!

My code is a little more complex than necessary since I wanted practice in
documentation, to use Numpy for matrix inversion, and proper command line support.
My initial implementation in C# didn't use external libraries and was much more
efficient, but that wasn't a goal for this version.
