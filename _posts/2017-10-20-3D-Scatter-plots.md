---
layout: post
title: Plotting art on a graph
image: /img/blog/goghpretty.png
tags: [script, python, matplotlib]

excerpt_separator: <!--more-->
---

I found some [beautiful scatter plots of famous art](https://imgur.com/a/aRBd1) and took it
as a challenge to recreate them! I naturally turned to matplotlib to graph the
colors as 3D Positions.
<!--more-->

## The Code
I used regular expressions for the extraction, and then wrote several output
formats for the links, including HTML anchor tags, markdown format, and the
currently shown format where urls are tabbed in. This was because pastebin
wouldn't accept links with alternate text.
{% highlight python %}
{% include assets/ProcessRedditLinks.py %}
# {% endhighlight %}
