# David-Carlson.github.io Portfolio Site

## P5 Support
<!-- http://milkyklim.com/p5-website-jekyll/ -->
Any page can now use p5 scripts. To do so, modify the page front matter:
    ---
    p5:
      - p5
      - addons/p5.sound
      - addons/p5.dom
    sketches:
      - setup_p5
   ---
 This loads the p5 scripts from a CDN into the footer-script section. That section defines which version of p5 is used (currently 0.5.16). Only the first p5 script is necessary - the last two are for fancy DOM and sound programs. 
 Sketches are the scripts that draw to the browser.
 To do so, add a div with an ID that you target in your sketch.  
