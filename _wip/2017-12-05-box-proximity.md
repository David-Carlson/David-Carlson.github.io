---
layout: post
title: Detecting points near Rectangles
image: /img/blog/blackbody/mainroo.jpg
github: David-Carlson/PyScripts
tags: [script, python, matplotlib]
excerpt_separator: <!--more-->
heat-graph:
  - link: https://upload.wikimedia.org/wikipedia/commons/1/19/Black_body.svg
    alt: A graph showing intensity vs. wavelength
    caption: Graph of Intensity vs. Wavelength of black-body radiation
---
<!-- TODO: Add image and inline images above -->
<!-- Add latex and/or SVG graphics -->

The challenge was to decide whether a 2D point is within a given distance to a rectangle, which might be rotated. I first solved this in C# but then decided to remake it in Python to graph/test my solution.
<!--more-->
## Initial Thoughts
Immediately, I started thinking about distance equations: Point->Point distance, Point->Line-segment, and Point->Axially-Aligned line. I could generate the 4 line segments and figure out if the point was inside/near them, but that sounded verbose and full of edge cases, pun intended. Instead, I decided to 'undo' the rectangle's transformations by finding the point's coordinates **relative** to the rectangle. This involved subtracting the rectangle's center from my point and calculating a transformation to rotate the point the opposite direction that the rectangle was rotated.
<!-- Picture showing rect transformation -->
<!-- Latex of matrices used -->
<!-- Link to resources used -->

After finding point_rect-local, I took the absolute value of the coordinates, which mirrors the point into the upper-right hand corner of the rect. This doesn't change the distance to the rect and allows me to reduce the number of cases. Finally, I did simple math to decide whether the point was within, directly above/right of the rectangle, or above **and** right. The first two cases involve subtracting distance to the rectangle edge. The last case involves point-point distance from the rectangle corner.

## Pretty graphs

<!--
{% include image-grid.html image-set=page.heat-graph class="col-xs-12" %}
<a href="https://www.youtube.com/watch?v=x0-qoXOCOow">XYZ Color space</a>
 -->
