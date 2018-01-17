---
layout: post
title: Algorithms for Mesh Manipulation
tags: [graphics, whitepaper]
excerpt_separator: <!--more-->
---
With this post I intend to explain the math behind [A sketch-based Interface for Detail-Preserving Mesh Editing](https://www.cs.tau.ac.il/~dcor/articles/2007/A-Sketch-Based.pdf), a whitepaper presented at SIGGRAPH. Their method allows one to easily make selections on a model and modify the geometry, silhouette, and other properties.

{% include youtubePlayer.html id="EMx6yNe23ug" %}
## My slideshow explanation
<div class="row">
<div class="col-xs-12">
<div class="videowrapper">
<iframe src="https://docs.google.com/presentation/d/e/2PACX-1vRo8DA7FeEsjQaZEdwZJZHyoLgit8V2XcH8TPet46ym6VPkKT3ptjqapr-EvjMRLpibZGKLBNF2vujo/embed?start=false&loop=false&delayms=5000" frameborder="0" width="960" height="569" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>
</div>
</div>
</div>

The slides above was my original explanation. Being a presentation format, it lacks the complete description, which I'll recreate below.

The method deals with **contours** on the model. These are curves that define the overall shape, such as a jaw line or brow ridge. Put another way:
> A sketch-based modeling system should use the very same sketches that designers would draw on a piece of paper to convey the shape. What are these lines? ... The Human visual system uses silhouettes as the first index into its memory of shapes, making everyday objects recognizable without color, shading or texture, but solely by their contours <sup><a href="https://www.cs.tau.ac.il/~dcor/articles/2007/A-Sketch-Based.pdf">[1]</a></sup>

One focus of the paper is to find contours such as silhouettes and modify in a aesthetic fashion, such as changing the profile of a nose. This involves changing the geometry to match the vertices on the silhouette with the intended path, while maintaining local shape.

Another goal is to draw lines on a model and create a sharp edge, *i.e* a ridge or ravine, along that line by creating new vertices, displacing the vertices along the drawn line while "preserving the geometric details of the surface as much as possible".

The crux of the math relies on understanding the mesh laplacian. This is a vector calculated for every vertex. It points in the direction of the surface normal and its length it proportional to the mean curvature at that point. It essence, it tells you how the surface is changing at a point and what direction the surface is facing. This can be used in an loss equation that puts a penalty on changing the curvature too drastically.
