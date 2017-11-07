---
layout: post
title: Black-body Radiation Simulation
github: BlackBody
tags: [graphics, java, sim]
excerpt_separator: <!--more-->
heat-graph:
  - link: https://upload.wikimedia.org/wikipedia/commons/1/19/Black_body.svg
    alt: A graph showing intensity vs. wavelength
    caption: Graph of Intensity vs. Wavelength of black-body radiation
---

With the help of a friend, Seán Ceallaigh, we built a graphics shader that
simulates the light that hot objects give off - black-body radiation.
This effect causeshot stoves to be red and stars to look whitish-blue.
<!--more-->
** The Science behind it
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


<!-- TODO ADD an inline link include -->
<!-- TODO Reformulate my picture format script -->