---
layout: post
title: Word Snack HD
image: /img/blog/blackbody/mainroo.jpg
github: cs327/WordSnack
tags: [graphics, unity, c#]
excerpt_separator: <!--more-->
heat-graph:
  - link: https://upload.wikimedia.org/wikipedia/commons/1/19/Black_body.svg
    alt: A graph showing intensity vs. wavelength
    caption: Graph of Intensity vs. Wavelength of black-body radiation
---
Word Snack HD is a free puzzle game for iOS and Android. Create words that match each alien's tastes to score! I helped program this game as part of a class at Hampshire College.

<!--more-->
## The Game: The Video
{% include youtubePlayer.html id="DcpZ1Ph1ugo"}

I convert the spectrum graph into the intermediary
<a href="https://www.youtube.com/watch?v=x0-qoXOCOow">XYZ Color space</a>.
XYZ is somewhat analogous to how the cones in human eyes work, called the
<a href="https://en.wikipedia.org/wiki/LMS_color_space">LMS Color Space</a>.
Changing from XYZ to RGB is a simple coordinate change which can be done with matrices.

## Show me the money
Finally, after implementing all this magic, we allowed any object in our ray
