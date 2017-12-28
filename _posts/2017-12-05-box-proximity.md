---
layout: post
title: Detecting points near Rectangles
image: /img/blog/box-proximity/rotate.jpg
github: David-Carlson/PyScripts
tags: [script, python, matplotlib, interview]
excerpt_separator: <!--more-->
rect-graph:
  - link: /img/blog/box-proximity/box.jpg
    alt: Plotting a normal rectangle
    caption: All points directly inside rectangle
  - link: /img/blog/box-proximity/rotate.jpg
    alt: Plotting a rotated rectangle
    caption: Plotting points near/inside rotated Rectangle
  - link: /img/blog/box-proximity/circle.jpg
    alt: Plotting a circle
    caption: Plotting distance to point
  - link: /img/blog/box-proximity/skew.jpg
    alt: Skewing the rectangle coordinates
    caption: Skewing the rectangle's local coordinates

---
<!-- TODO: Add image and inline images above -->
<!-- Add latex and/or SVG graphics
https://www.janvas.com/v6.1/janvas_web_6.1/en/howto.php
-->

The challenge was to decide whether a 2D point is within a given distance to a rectangle, which might be rotated. I first solved this in C# but then decided to remake it in Python to graph/test my solution.
<!--more-->

## Initial Thoughts
Immediately, I started thinking about distance equations: Point->Point distance, Point->Line-segment, and Point->Axially-Aligned line. I could generate the 4 line segments and figure out if the point was inside/near them, but that sounded verbose and full of edge cases, pun intended. Instead, I decided to 'undo' the rectangle's transformations by finding the point's coordinates **relative** to the rectangle. This involved subtracting the rectangle's center from my point and calculating a transformation to rotate the point the opposite direction that the rectangle was rotated.
<!-- Picture showing rect transformation -->
<!-- Latex of matrices used -->
<!-- Link to resources used -->

After finding rect-relative-point, I took the absolute value of the coordinates, which mirrors the point into the upper-right hand corner of the rect. This doesn't change the distance to the rect and allows me to reduce the number of cases. Finally, I did simple math to decide whether the point was within, directly above/right of the rectangle, or above **and** right. The first two cases involve subtracting distance to the rectangle edge. The last case involves point-point distance from the rectangle corner.

{% include image-grid.html image-set=page.rect-graph class="col-md-6 col-xs-12" %}
Great, so the initial plots look correct for a normal rectangles. My plan to visualize it worked it, meaning I can see many results at once. The third picture shows the points close to an infinitely small rectangle. As predicted, it's a circle. Lastly, I tried changing the rectangle's axes so they weren't 90 degrees from each other. This results in a parallelogram, as seen in the last image. Success!
