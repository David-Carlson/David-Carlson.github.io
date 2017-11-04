---
layout: post
title: Plotting art on a graph
image: /img/blog/3DScatterPlot/goghpink.jpg
tags: [script, python, matplotlib]
image-set:
  - link: /img/blog/3DScatterPlot/plots/dali.jpg
    alt: Salvador Dali, The Persistence of Memory
    text: The Persistence of Memory
  - link: /img/blog/3DScatterPlot/plots/pprint-dali.jpg
    alt: Salvador Dali Scatter Plot
    text: Salvadoe Dali
  - link: /img/blog/3DScatterPlot/plots/gogh.jpg
    alt: Vincent Van Gogh, 'Self-Portrait'
    text: 'Self-Portrait'
  - link: /img/blog/3DScatterPlot/plots/pprint-gogh.jpg
    alt: Van Gogh plot
    text: Vincent Van Gogh

excerpt_separator: <!--more-->
---

I found some <a href="https://imgur.com/a/aRBd1" target="_blank">beautiful scatter
   plots of famous art</a> and took it as a challenge to recreate them! I naturally
   turned to Matplotlib to graph the colors as 3D Positions.
<!--more-->
<!-- class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1" -->
{% assign img-class="center-block col-lg-6 col-md-6 col-sm-6 col-xs-12" %}
<!-- <div class="container mx-auto"> -->
  <div class="row">
    {% for i in page.image-set %}
      {% include img-grid.html link=i.link alt=i.alt caption=i.text class=img-class %}
    {% endfor %}
  </div>
<!-- </div> -->

Usage:  I used Python's ArgumentParser to make my tool easier to use. An example use:

```
python PlotImage.py *.jpg --points 20000 --save --pprint
```
This plots all Jpeg images using at most 20,000 points from the image. It pretty-prints
the plot by removing axis labels, titles, and doesn't draw the original image.
Lastly, it saves the plot image with a prefix added to the filepath.


More will be added soon!

<!-- Images in bootstrap grids -->

<!-- Code samples -->
