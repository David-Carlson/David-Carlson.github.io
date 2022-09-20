---
layout: post
title: Kafkanauts Data Generator
github: BigData2022RevatureProject3/Kafkanauts
tags: [scala, aws, spark, kafka]
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
basis1:
  - link: /img/blog/box-proximity/latex/basis1.png
    alt: Change of base from rect coordinates to global

---
A team project - we generated millions of fake Data Records for purchases, all hiding subtle patterns. We sent the data to our rival team using AWS/Kafka and then analyzed the data to find the other team's patterns via Spark.
<!--more-->
## Overview
The overall goal was to practice a complex group project using a variety of software including Kafka, EC2, Zeppelin and Hive. Given a schema for Product Orders, we generated our own product categories and through a mixture of procedural generation and using web-scraped data, we made a system that can create millions of unique Product Orders to push to the other team. When we received the other team's data we spent a large amount of time cleaning the data and ensuring correct parsing before graphing a litany of relationships and calculating various correlations.



<div class="row">
<div class="col-xs-12">
<div class="videowrapper">
<iframe src="https://docs.google.com/presentation/d/e/2PACX-1vSkine3a1v985RiGu9A_LJw0z1aYP8GgSBgcERGdvf-eWwpYfq5LgbyONVOU9kQgR3XlFVxqsBsdM1f/embed?start=false&loop=false&delayms=3000" frameborder="0" width="960" height="569" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>
</div>
</div>
</div>

## Responsibilities
- Led team Kafkanauts, helping organize our work on Git, delegating assignments and structuring our day to
day work
- Developed the sampling based Production pipeline, which creates a variable number of products
throughout each day based on statistics
- Maintained consistant style across a broad codebase, coordinating when possible with the other team lead
to ensure technology parity
- Setup Kafka, Java and Scala on EC2
- Spark-submitted our Production programs on our EC2 instance
- Consumed ProductOrder topics through a local Kafka consumer, parsed for validity and saved in Hive
- Analyzed the accumulating data using Spark
- Graphed patterns in Zeppelin to illustrate complicated relationships

## Generation
I lead the design work for making a Product Order generation pipeline. A major goal of mine was 
make a system where the we can generate variable traffic based on time of time 
(and also generate data faster than real-time for practical reasons). Our products are
generated for America, Mexico and China and thus each country uses a different function
for each class of product. These functions are shifted left/right to account for 
timezones, then combined. 


The sum of all functions represents how many products
are being made, which decides how many Product Orders we'll make in the next batch.
From there, each product is probabilistically assigned a country and category based
on the aforementioned functions. From there they pass through the generator functions
that my team wrote which assigns product information like name, price, quantity, and
location based on either code or large databases of products we found and cleaned.
Each product has a small chance of being corrupted before being sent off to the 
other team.  


## Analysis
Upon receiving the other team's data, we face a huge problem with how to detect which Product Orders we read are actually intentionally corrupted. We used multiple techinques including some 




