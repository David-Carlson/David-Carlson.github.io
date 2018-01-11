---
layout: post
title: Simulating the Atmosphere
image: /img/blog/blackbody/mainroo.jpg
github: BlackBody
tags: [graphics, java, sim]
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

Interested in light and the differential equations around it, I decided to try simulate how sunlight scatters, creating rich horizons and blue skies.
<!--more-->
## End results
<!-- Pictures and setup of project -->
<!-- Build up math from latex/svg graphics -->
{% include image-grid.html image-set=page.heat-graph class="col-xs-12" %}

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
