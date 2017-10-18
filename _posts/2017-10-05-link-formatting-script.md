---
layout: post
title: Link Formatting Script
image: /img/hello_world.jpeg
tags: [script, python, regex]
---

I recently saw a giant list of links to Udemy courses, in the form:
```
Coupons are valid for a limited time only, so grab them while they last.
WEB DEVELOPMENT
www.udemy.com/ultimate-web/learn/v4/?couponCode=LRNWEB
www.udemy.com/responsive-website-template-from-scratch-html-css/?couponCode=FREEFB
www.udemy.com/web-design-creating-websites-from-scratch/?couponCode=WEBFREE
```

I found this unwieldy and impossible to read. I wrote a python script to
extract out the titles and add formatting as such:
```
Coupons are valid for a limited time only, so grab them while they last.
WEB DEVELOPMENT
------------------------------------------------------------------------------
ultimate web
		www.udemy.com/ultimate-web/learn/v4/?couponCode=LRNWEB

responsive website template from scratch html css
		www.udemy.com/responsive-website-template-from-scratch-html-css/?couponCode=FREEFB

web design creating websites from scratch
		www.udemy.com/web-design-creating-websites-from-scratch/?couponCode=WEBFREE
```




{% highlight python %}
{% include assets/ProcessRedditLinks.py %}
{% endhighlight %}
