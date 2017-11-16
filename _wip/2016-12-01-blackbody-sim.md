---
layout: post
title: Black-body Radiation Simulation
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
bright:
  - link: /img/blog/blackbody/bright.jpg
    alt: Sphere light scaled to reasonable bounds
    caption: Energy normalized
dinos:
  - link: /img/blog/blackbody/purple.jpg
    alt: A purple velociraptor
  - link: /img/blog/blackbody/blue.jpg
    alt: A blue velociraptor
ext-js:
  - "https://cdnjs.cloudflare.com/ajax/libs/processing.js/1.6.6/processing.min.js"
---
<!--
p5:
  - p5
sketches:
  - setup -->
<!-- ext-js:
  - "https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.5.8/p5.min.js"
  - "https://cdnjs.cloudflare.com/ajax/libs/processing.js/1.6.6/processing.min.js" -->

With the help of a friend, Seán Ceallaigh, we built a graphics shader that
simulates the light that hot objects give off - black-body radiation.
This effect causeshot stoves to be red and stars to look whitish-blue.
<!--more-->

## The Science behind it
The heart of the algorithm is a function that takes a temperature and a wavelength
and outputs the intensity. You can plot this on a graph to see what the light
would look like. Below, each line represents the output of all wavelengths for a
given temperature.
{% include image-grid.html image-set=page.heat-graph class="col-xs-12" %}

I convert the spectrum graph into the intermediary
<a href="https://www.youtube.com/watch?v=x0-qoXOCOow">XYZ Color space</a>.
XYZ is somewhat analogous to how the cones in human eyes work, called the
<a href="https://en.wikipedia.org/wiki/LMS_color_space">LMS Color Space</a>.
Changing from XYZ to RGB is a simple coordinate change which can be done with matrices.

## An interactive example!
{% assign datasrc = '/assets/sketches/blackbodyOG.pde' %}
<canvas class="blackbody-canvas"
  data-processing-sources="{{ datasrc }}">
</canvas>

## Show me the money
Finally, after implementing all this magic, we allowed any object in our ray
tracer to have a temperature and our corresponding black-body shader. Here
are the initial results:
{% include image-grid.html image-set=page.scale class="col=xs-12 float-md-right" %}
As you can see, each sphere has the correct hue as they increase in temperature.
We quickly realized that our equation has a flaw; As temperature doubles, the
energy emitted goes up 16 fold! This meant that the image was nigh-impossible
to expose with our virtual cameras. We ended up using a mixture of HDR and scaling
the intensity of light to reasonable bounds.
{% include image-grid.html image-set=page.bright class="col-xs-12 float-left-md" %}

Lastly, we wanted to see what our shaders would do when using impossible
physical constants, as well as other changes. This resulted in some crazy
renders!
{% include image-grid.html image-set=page.dinos class="col-md-6 col-xs-12" %}



<!-- TODO ADD an inline link include -->
