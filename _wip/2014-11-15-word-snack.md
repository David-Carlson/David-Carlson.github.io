---
layout: post
title: Word Snack HD
tags: [graphics, unity, c#]
github: cs327/WordSnack
excerpt_separator: <!--more-->
heat-graph:
  - link: https://upload.wikimedia.org/wikipedia/commons/1/19/Black_body.svg
    alt: A graph showing intensity vs. wavelength
    caption: Graph of Intensity vs. Wavelength of black-body radiation
---
<!-- TODO Add in latex? https://www.e-education.psu.edu/astro801/content/l3_p5.html -->
<!-- TODO!!!!! Add in interactive ProcessingJS -->

Word Snack was created by the Interdisciplinary Game Studio class during Fall
2014 at Hampshire College. Led by Professors Chris Perry and Ira Fay, the team
of 34 members from the Five College consortium created WordSnack from scratch in four months.
<!--more-->


<iframe width="560" height="315" src="https://www.youtube.com/embed/DcpZ1Ph1ugo?rel=0"
  frameborder="0" allowfullscreen></iframe>

My role in this game was as a C# Programmer and tools engineer. I helped early
design choices for how to represent scoring bonuses: Delegates allowed us to
easily modularize scoring by writing the structure for how these functions operate
and allowing one to swap them out seamlessly at runtime. I also created the
entirety of the end-screen, which is a receipt of the scored words.
