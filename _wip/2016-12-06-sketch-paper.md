---
layout: post
title: Algorithms for Mesh Manipulation
image: /img/blog/blackbody/mainroo.jpg
tags: [graphics, whitepaper]
excerpt_separator: <!--more-->
heat-graph:
  - link: https://upload.wikimedia.org/wikipedia/commons/1/19/Black_body.svg
    alt: A graph showing intensity vs. wavelength
    caption: Graph of Intensity vs. Wavelength of black-body radiation
scale:
  - link: /img/blog/blackbody/scale.jpg
    alt: Three hot spheres emitting their predicted color
    caption: Three hot spheres emitting their predicted color
---
With this post I intend to explain the math behind [A sketch-based Interface for Detail-Preserving Mesh Editing](https://www.cs.tau.ac.il/~dcor/articles/2007/A-Sketch-Based.pdf), a whitepaper presented at SIGGRAPH. Their method allows one to easily make selections on a model and modify the geometry, silhouette, and other properties.

{% include youtubePlayer.html id="EMx6yNe23ug" %}

I convert the spectrum graph into the intermediary
<a href="https://www.youtube.com/watch?v=x0-qoXOCOow">XYZ Color space</a>.
XYZ is somewhat analogous to how the cones in human eyes work, called the
<a href="https://en.wikipedia.org/wiki/LMS_color_space">LMS Color Space</a>.
Changing from XYZ to RGB is a simple coordinate change which can be done with matrices.

## Show me the money
Finally, after implementing all this magic, we allowed any object in our ray
tracer to have a temperature and our corresponding black-body shader. Here
are the initial results:
{% include image-grid.html image-set=page.scale class="col=xs-12" %}
As you can see, each sphere has the correct hue as they increase in temperature.
We quickly realized that our equation has a flaw; As temperature doubles, the
energy emitted goes up 16 fold! This meant that the image was nigh-impossible
to expose with our virtual cameras. We ended up using a mixture of HDR and scaling
the intensity of light to reasonable bounds.
{% include image-grid.html image-set=page.bright class="col-xs-12" %}

Lastly, we wanted to see what our shaders would do when using impossible
physical constants, as well as other changes. This resulted in some crazy
renders!
{% include image-grid.html image-set=page.dinos class="col-md-6 col-xs-12" %}



<!-- TODO ADD an inline link include -->
