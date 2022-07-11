---
layout: post
title: Spotify Analyzer
image: /img/blog/Spotify/spotify-logo.png
github: David-Carlson/SpotifyAnalyzer
tags: [scala, api, spark]
excerpt_separator: <!--more-->
rect-graph:
  - link: /img/blog/box-proximity/box.jpg
    alt: Plotting a normal rectangle
    caption: All points directly inside rectangle
  - link: /img/blog/box-proximity/rotate.jpg
    alt: Plotting a rotated rectangle
    caption: Plotting points near rotated Rectangle
  - link: /img/blog/box-proximity/circle.jpg
    alt: Plotting a circle
    caption: Plotting distance to point
  - link: /img/blog/box-proximity/skew.jpg
    alt: Skewing the rectangle coordinates
    caption: Skewing the rectangle's local coordinates
---
I used Spotify's API paired with my own web scraping code to download a user's playlist meta-data and then used Spark to find relevant patterns.
<!--more-->

## Web Scraping
This is a multi-step process that starts with supplying the Spotify ID of the users you are interested in, and some limits on how much music meta-data to download. I start by downloading all users' Playlists, from which I get information on every Song. I use that information to find each Album and Artist related to these Songs, as well as the Genres associated with Artists/Albums. I parse this information into my own DataObjects, while dealing with dropped API calls, Null Songs and Albums with only Null Songs. 

With this information I write it all in a SQL format along with a custom manifest that details what information is within, how many Songs/Albums, and a calculated Hash that summarizes how I output the information so I can correctly read it. This results in a data Archive consisting of a particular set of Users' data. 

Here's an example of my output while scraping:
<pre><code class="python">
{% include blog/Spotify/example-scrape.txt %}
</code></pre>

## Analysis
Each Archive can be loaded separated to have analyses run on them. They are accessed through an interactive terminal where Admins can load/modify Archives and Users can login to query their data to ascertain new patterns using Spark Sql. A User can ask questions like what Genres do they listen to more than the others, and vice versa, or which user listens to the most profane albums. I correlate Users to average Album length to find patterns like how listens to more Classical music/Film scores versus short Pop songs. 


