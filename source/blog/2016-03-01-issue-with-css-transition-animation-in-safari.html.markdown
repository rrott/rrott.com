---
title: Bug with CSS transition animation for SVG in Safari
short: Bug with CSS transition animation for SVG in Safari
date: 2016-03-01 13:30 UTC
tags: CSS, SVG, Web-Design, Front-End, Animation, Safari, Bugs
category: SVG

---
#Bug with CSS transition animation for SVG in Safari.

Recently I've been working on an interesting issue in [GitLab Community Edition
](https://gitlab.com/gitlab-org/gitlab-ce/issues/11867) and decided to share results of my research with the community.

##The issue


Assume we have SVG image inlined into a page where the following SCSS animates `.tanuki-shape` SVG on hover:

```scss
.tanuki-shape {
  transition: all 0.8s;

  &:hover, &.highlight {
    fill: rgb(255, 255, 255);
    transition: all 0.1s;
  }
}
```

In Chrome and Firefox, the logo animation has a nice fade-out effect on each piece:

<img class='pure-img-responsive' title="GitHub Logo in FireFox and Chrome", alt="GitHub Logo in FireFox and Chrome", src="/images/blog/safari-svg-animation/good-logo-chrome.gif"/>

But Safari doesn't seem to respect the transition property, and we get no fade:

<img class='pure-img-responsive' title="GitHub Logo in Safari", alt="GitHub Logo in Safari", src="/images/blog/safari-svg-animation/bad-logo-safari.gif"/>

> Note, there are several ways to put SVG image into a page: 
> 
> 1. use it directly in an `<img>` tag.
> 
> 2. use SVG as `background-image` of a div.
> 
> 3. using inline SVG.
> 
> The only way to have CSS animation in SVG is inlining images into a page and I am describing this particular case.


---
##Investigation
###Assumption:
The very first assumption was: the reason why this transition animation does not work in Safari is because it is inside a link. It looked like Safari stops all animation on the image once the link's `hover` event is triggered, but I found nothing about this in specs and standards.

###Research:
Above assumption was a quite correct, as sometimes this transition animation was working correctly on one machine while failing unpredictable on another and vice versa. It looked strange and I saw no consistent pattern there. 

I did a research and after deeper investigation and dozens manual tests, I found that the **transition stops working for all the visited links** and that could be the reason why I was not able to reproduce the issue on one machine while it is failed on another. 
Here is my Proof of Concept: 

<img class='pure-img-responsive' title="Animation stops working for all the visited links in Safari", alt="Animation stops working for all the visited links in Safari", src="/images/blog/safari-svg-animation/safari-visited-links-bug.gif"/>

Looks like Safari has the same protection of users' history as Mozilla, but with its own realisation: [Privacy and the :visited selector](https://developer.mozilla.org/en-US/docs/Web/CSS/Privacy_and_the_:visited_selector)

Sadly, changing `:visited` pseudo in CSS as well as using `xmlns:xlink` inside of SVG does not make transition working again and there are no hacks there.

###Solution:
I see several solutions there but, unfortunately, none of them are good enough:
  
  1. add some random data to the link(something like `/#timestamp` that looks ugly but the link will always be 'unvisited' for the users).
  
  2. Do not use animation and inlined SVG in links.
  
  3. Put link above SVG image using `position` and `z-index` so the image is 'clickjacked'. It works but requires additional js code to handle image's `hover` event to not loose `on hover` animation, e.g. add Jquery code that will handle clicks on logo and change `window.location`.
  
  4. Dynamically move SVG outside of the link in case of Safari.
  
  3. Leave it as is if you have low amount of Safari users.

---
Here is my **Merge Request** to the project: [Fixes for issue with poor logo transition animation on safari](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/2690#note_3543658) 

This solution moves logo outside of the link and sets logo above it using position and z-index so the link is 'clickjacked': When you hover the image, the animation is working as expected, but to handle clicks I had to add jquery call.

```scss
  .home {
    z-index: 1;
    position: absolute;
  }
  #logo {
    z-index: 2;
    position: absolute;
    cursor: pointer;

  }
```

Where `#logo` is a new div that has our `.tanuki-shape` SVG image inside.

---
| SVG image in Safari before | and after the change |
|:--------------------------:|:--------------------:|
| <img class='pure-img-responsive' title="SVG animation in Safari before chages", alt="SVG animation in Safari before chages", src="/images/blog/safari-svg-animation/logo_before_change.gif"/> | <img class='pure-img-responsive' title="SVG animation in Safari before chages", alt="SVG animation in Safari before chages", src="/images/blog/safari-svg-animation/logo_after_change.gif"/> | 


P.S. Try GitLab, you'll like it!
