---
title: cosnole.alert browser extension
short: cosnole.alert
date: 2021-08-15 12:44 UTC
tags: security
category: security

---

<p align="center">
  <img src="/images/blog/cosnole-alert/cosnole-256.png" width="128" height="128"/>
</p>

<h1 align="center">cosnole.alert</h1>


# what is it about?
This blog post is about my new browser's extension that could help pentesters, web developers and QAs with debugging and bugfixing of the web-apps.


# what? 
**cosnole.alert** is a web browser extension to shows logs, errors and warnings as toast messages to help you catch bugs faster.
It extends browser's console object with the alert() function.

# why?
Some Web application Fiewalls or web developers could block or filter out standard alert() methods to "protect" their websites from maliscuous attacks, but having alert, prompt or confirm method disabled does not mean tha the application safe and protected against XSS. 
If a pentester or QA can not run window.alert() ethod to prove a bug's existance, it does not mean thet the bug is not there and an ataacker could not use it. They will not use alert() as a part of attack, instead they will inject a JavaScript code and an incorrect filtering or poor WAF will not prevent them from dooing this.
That's why I'v wrote the extension. it will allow you to use custom global methods to trigger alerts, it will add additional methods to console object or even trigger an alert on  all console.log() calls.
You can also use it to show Toast messages on all console.log() calls so if you, as a pentester use console.log() instead of alert() in your payloads, you'll see the message directly on the page, without needs  to open browser's console.

Another common blacklisted word is “alert”, which can be bypassed easily by using prompt(1), console.log(1), or literally anything else.

# will it work everywhere?
I can not guarantee that it will work everywhere and will not miss anything, because of the JavaScript's asynchronuoumus nature.
I've tested it against all the XSS labs provided by PortSwigger and was abble to catch all the bug, so it is good enaught.
Additionally, I've emplemented 3 different modes, that can be used depending on the app, its filters, CSP configurations and the environment.

# how to?

### console.alert?
<p class='flex wrap'>
  <img class='responsive' alt="cosnole.alert modes" src="/images/blog/cosnole-alert/alert.png"/>
</p>

alert() is a method of the global window object that can be called directly from any part of your application. In some case it is used to stop Javascript's runtime and prevent users and browsers from doing any actions and request till user close the modal, but in the most cases it is used by ethical hackers to prove that an application has an XSS that can run ANY javaScript code injected by an attacker.
In some case thes method can be blocked or filtered out, but it does not mean that the issue is gone and nobdy can use it. It is a good practice to try using console.log() method to test it out, but it is harder to catch the issue without oppening browser's console.
The extensions provides an alternative method - console.alert() taht is a map to the alert() method. It can be usefull in case app re0defines windiw.alert() or blocks any alert() calls from a global window object, bt igoners ewerything elses.


### toast messages?
There are two useful features there. 
1st: you can see all the console.log(), warn(), info() calls without oppening browser's console. 
In this case you can catch a bug, warning or an error of any web-site you are browsering through, so something interesting can be saw and investigated.
2nd: if you use console.log(1) instead of common-used alert(1) method, you can catch the bug immidiatelly, without any interaction with browser's console.

<p class='flex wrap'>
  <img class='responsive' alt="cosnole.alert modes" src="/images/blog/cosnole-alert/toasts.png"/>
</p>


### use modes?
The extension provides 3 modes to use and you can switch the mode depending on your needs and the web-site's configurations

<p class='flex wrap'>
  <img class='responsive' alt="cosnole.alert modes" src="/images/blog/cosnole-alert/modes.png"/>
</p>

### Redefined console Methods?

<p class='flex wrap'>
  <img class='responsive' alt="cosnole.alert modes" src="/images/blog/cosnole-alert/redefined-console-methods.png"/>
</p>

### Custom console Methods?

<p class='flex wrap'>
  <img class='responsive' alt="cosnole.alert modes" src="/images/blog/cosnole-alert/custom-console-methods.png"/>
</p>

### Custom global Methods?

<p class='flex wrap'>
  <img class='responsive' alt="cosnole.alert modes" src="/images/blog/cosnole-alert/custom-global-methods.png"/>
</p>

### Show Alerts For?

<p class='flex wrap'>
  <img class='responsive' alt="cosnole.alert modes" src="/images/blog/cosnole-alert/show-alerts-for.png"/>
</p>

### Show Toasts For?

<p class='flex wrap'>
  <img class='responsive' alt="cosnole.alert modes" src="/images/blog/cosnole-alert/custom-toasts-methods.png"/>
</p>

### Auto-hide Toasts?

<p class='flex wrap'>
  <img class='responsive' alt="cosnole.alert modes" src="/images/blog/cosnole-alert/auto-hide-toasts.png"/>
</p>

### Alert Timeout?

<p class='flex wrap'>
  <img class='responsive' alt="cosnole.alert modes" src="/images/blog/cosnole-alert/alert-timeout.png"/>
</p>

### Oklahoma?

<p class='flex wrap'>
  <img class='responsive' alt="cosnole.alert modes" src="/images/blog/cosnole-alert/trigger-to-show-alerts.png"/>
</p>

### regexp ?

<p class='flex wrap'>
  <img class='responsive' alt="cosnole.alert modes" src="/images/blog/cosnole-alert/regexp-to-show-alerts.png"/>
</p>


### Method to use as alert?

<p class='flex wrap'>
  <img class='responsive' alt="cosnole.alert modes" src="/images/blog/cosnole-alert/method-to-use-as-alert.png"/>
</p>

### Reflect alert() in console?

<p class='flex wrap'>
  <img class='responsive' alt="cosnole.alert modes" src="/images/blog/cosnole-alert/reflect-alert-in-console.png"/>
</p>


### pre-hook or after-hook ?

<p class='flex wrap'>
  <img class='responsive' alt="cosnole.alert modes" src="/images/blog/cosnole-alert/hooks.png"/>
</p>

### block/allow list?

<p class='flex wrap'>
  <img class='responsive' alt="cosnole.alert modes" src="/images/blog/cosnole-alert/lists.png"/>
</p>

# which browsers?
#### It was tested in the following browsers
<div style="display: flex; flex-direction: row; flex-wrap: wrap;">
    <span><img style="height: 6rem" src="/images/blog/cosnole-alert/browsers/chrome_256x256.png" /></span>
    <span><img style="height: 6rem" src="/images/blog/cosnole-alert/browsers/chromium_256x256.png" /></span>
    <span><img style="height: 6rem" src="/images/blog/cosnole-alert/browsers/brave_256x256.png" /></span>
    <span><img style="height: 6rem" src="/images/blog/cosnole-alert/browsers/edge_256x256.png" /></span>
    <span><img style="height: 6rem" src="/images/blog/cosnole-alert/browsers/vivaldi_256x256.png" /></span>
    <span><img style="height: 6rem" src="/images/blog/cosnole-alert/browsers/opera_256x256.png" /></span>
</div>
but should work in all the chromium-based browsers

# FireFox or Safari?
I do have plans to port the extension to FireFox and Safari, but I need more time to check s it possible to do this and how much time it can take.
No ETA at the moment, but can be done in the nearest future!

# how does it work?

# how much?
It's an open-source extension, relesased under the MIT license, so it is free of charge and you can use it free of charge and add any feature you want.


# where I can get it?

# shut up and teke my money!
It's open-source with no cost to use, but if you have some free resources you can share your expirience, knowladge or money to support the project.
PRs are welcome:
Issues are welcome:
Proposals are welcome:
Patrons are welcome:
You are welcome =)