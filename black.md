---
layout: post
title: Black-body Radiation Simulation
github: BlackBody
tags: [graphics, java, sim]
excerpt_separator: <!--more-->
---

With the help of a friend, Seán Ceallaigh, we built a graphics shader that
simulates the light that hot objects give off - black-body radiation.
This effect causeshot stoves to be red and stars to look whitish-blue.
<!--more-->

The heart of the algorithm is a function that takes a temperature and a wavelength
and outputs the intensity. You can plot this on a graph to see what the light
would look like. Below, each line represents the output of all wavelengths for a
given temperature. Once this is obtained, one needs to convert it to RGB units
to display it.

<!-- https://upload.wikimedia.org/wikipedia/commons/1/19/Black_body.svg -->

<!-- convert chromaticity into wiki link -->
<!-- https://en.wikipedia.org/wiki/Chromaticity -->
<!-- https://en.wikipedia.org/wiki/LMS_color_space -->
I convert the spectrum graph into the intermediary XYZ Color space. XYZ is
somewhat analogous to how the cones in human eyes work, called the
<a href="https://en.wikipedia.org/wiki/LMS_color_space">LMS Color Space</a>.
The Y coordinate represents luminance, Z is "quasi-equal to blue stimulation",
and X is effectively a combination of

<!-- TODO ADD an inline link include -->
<!-- TODO Reformulate my picture format script -->
