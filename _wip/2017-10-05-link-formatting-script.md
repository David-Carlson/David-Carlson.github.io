---
layout: post
title: Link Formatting Script
github: PyScripts
tags: [script, python, regex]
excerpt_separator: <!--more-->
---

I recently saw a giant list of links to Udemy courses, in the form below.
I found this unwieldy and impossible to read, so I wrote a python script to
extract out the titles and add formatting.
<!--more-->

```plaintext
Coupons are valid for a limited time only, so grab them while they last.
WEB DEVELOPMENT
www.udemy.com/ultimate-web/learn/v4/?couponCode=LRNWEB
www.udemy.com/responsive-website-template-from-scratch-html-css/?couponCode=FREEFB
www.udemy.com/web-design-creating-websites-from-scratch/?couponCode=WEBFREE
```

My script changed the links and added
dashed separators to distinguish when the topic changed.
```plaintext
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

## The Code
I used regular expressions for the extraction, and then wrote several output
formats for the links, including HTML anchor tags, markdown format, and the
currently shown format where urls are tabbed in. This was because pastebin
wouldn't accept links with alternate text.
```python
{% include blog/ProcessRedditLinks.py %}
```
