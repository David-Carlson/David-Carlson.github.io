---
layout: post
title: Plotting art on a graph
image: /img/blog/goghpink.jpg
tags: [script, python, matplotlib]
image-set:
  - path: /img/blog/goghpink.jpg
    alt: Alt text 1
    text: Text 1
  - path: /img/blog/what.png
    alt: This is alt text 2
    text: text 2

excerpt_separator: <!--more-->
---

I found some <a href="https://imgur.com/a/aRBd1" target="_blank">beautiful scatter plots of famous art</a> and took it as a challenge to recreate them! I naturally turned to Matplotlib to graph the colors as 3D Positions.
<!--more-->

{% assign img-class="col-lg-3 col-md-3 col-sm-3 col-xs-12" %}
<p> {{ img-class }}</p>
{% for image in page.image-set %}
  <p> {{ image.path }}</p>
  <p> {{ image.alt }}</p>
  <p> {{ image.text }}</p>
{% endfor %}
<!-- <div class="container">
  <div class="row">
    <div class={{ img-class}}>
      <img src="" class="img-responsive" alt="">
    </div>
  </div>
</div> -->

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
