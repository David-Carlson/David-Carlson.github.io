---
layout: post
title: Word Snack HD
image: /img/blog/wordsnack/icon.jpg
github: cs327/WordSnack
tags: [graphics, unity, c#]
excerpt_separator: <!--more-->
ingame-chars:
  - link: /img/blog/wordsnack/gameplay.jpg
    alt: Gameplay example
  - link: /img/blog/wordsnack/characters.jpg
    alt: Character screen
receipt:
  - link: /img/blog/wordsnack/receipt.jpg
    alt: The end screen of the game
    caption: My work on the end-screen receipt
---
Word Snack HD is a free puzzle game for iOS and Android. Create words that match each alien's tastes to score! I helped program this game as part of a class at Hampshire College.

<!--more-->
## The Game: The Video

{% include youtubePlayer.html id="DcpZ1Ph1ugo" %}

> Word Snack is a single player word game set in a diner in outer space. Feed words to hungry aliens, receive points for every word, and turbocharge your score by catering to their alien tastes. Some aliens love short words, others love long ones. Some crave consonants, others can’t get enough of vowels.

{% include image-grid.html images=page.ingame-chars class="col-xs-12 col-sm-6" %}

## The code
C# was already my favorite language when I joined this team, which put me in a good position to guide the internal development. In the beginning I focused on finding the best data structures and C# features for scoring and handling words. I suggested using [delegate functions](http://rbwhitaker.wikidot.com/c-sharp-delegates) to represent each alien's taste in words. This let us assign them at runtime and swap them at will. We used a [Trie](https://en.wikipedia.org/wiki/Trie) to represent all the allowable words in our dictionary, a modified version of the Scrabble dictionary. This allows efficient lookup of words so that the game can tell you if a word is acceptable as you build it.

## The receipt
{% include image-grid images=page.receipt class="cols-xs-12" %}
My last obligation was to create a receipt to show the words & scores earned throughout the match. We saved all the words created during the round, which meant I had to programmatically create images and text that looks good across different screen sizes. It was a fun job!
