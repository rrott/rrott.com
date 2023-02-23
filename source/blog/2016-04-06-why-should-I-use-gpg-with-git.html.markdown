---
title: Why should I use git with GPG?
short: Why should I use git with GPG?
date: 2016-04-06 10:49 UTC
tags: git, gpg, security, github
category: security
---
# How to use GPG signature verification with git?
You probably missed this recent news from [GitHub](https://github.com/blog/2144-gpg-signature-verification) because it may sound like marketing bullshit you can leave without. Actually, you can, but if you care about who exactly commits to your repo, you should not.

### In short:

You can easily impersonate commits, as demonstrated in the following example, where [Aaron Paterson](https://github.com/tenderlove) is listed as one of the contributors in the project, even though he is not.

<a href="/images/blog/gpg-and-github/Aaron-Patterson-Commitst-to-my-git.png", title="Aaron Patterson Commitst to my git">
  <img class='blog-image', data-index="0", alt="Aaron Patterson Commitst to my git", src="/images/blog/gpg-and-github/Aaron-Patterson-Commitst-to-my-git.png"/>
</a>

## What are the benefits of using GPG with git?

>Git itself is cryptographically secure, but it’s not foolproof. If you’re taking work from others on the internet and want to verify that commits are actually from a trusted source, Git has a few ways to sign and verify work using GPG.

>[source](https://git-scm.com/book/uz/v2/Git-Tools-Signing-Your-Work)

Commits and tags can be signed using GPG in Git, and both GitHub and GitLab will indicate when commits and tags have been signed.

## The Attack

With a simple `git config` command, you can set any username or email, whether it is real, fake, or impersonated, for any of your repositories:

```bash
$ git config user.name "Aaron Patterson"
$ git config user.email "tenderlove@github.com"
```

The verification of your identity is not prompted, as it follows the standard behavior of Git.


```bash
$ git commit -am "Updated readme"
[master 1d8e0ca] Updated readme
 1 file changed, 1 insertion(+)

$ git push
Counting objects: 3, done.
Writing objects: 100% (3/3), 274 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To git@github.com:rrott/gpg_test.git
   44fa75c..1d8e0ca  master -> master
```

And here is the result as it is shown on GitHub:

<a href="/images/blog/gpg-and-github/tender-love-commits-poc.png", title="Aaron Patterson Commitst to my git">
  <img class='blog-image', data-index="1", alt="Aaron Patterson Commitst to my git", src="/images/blog/gpg-and-github/tender-love-commits-poc.gif"/>
</a>

Repo to check: <a href="https://github.com/rrott/gpg_test/commits/master/README.md" target="_blank" rel="noopener noreferrer">rrott/gpg_test</a>

---
## What is the process of integrating GPG with git?

I won't cover each step in detail since there are already comprehensive guides available on GitHub that cover everything you need:

<a href="https://help.github.com/categories/gpg/" target="_blank" rel="noopener noreferrer">All about GPG in github</a>

<a href="https://help.github.com/articles/generating-a-gpg-key/" target="_blank" rel="noopener noreferrer">Generating a GPG key</a>

<a href="https://git-scm.com/book/en/v2/Git-Tools-Signing-Your-Work" target="_blank" rel="noopener noreferrer">Git Tools - Signing Your Work</a>

If you don't have a GPG key, use the following commands to generate it:

```bash
$ gpg --gen-key
$ gpg --list-secret-keys
$ gpg --armor --export roman.rott@gmail.com
```

Add your newly created GPG key to GitHub and then try to commit something once again:

```bash
$ git commit -S -am "Committed with GPG"
 ```

That's it:

<a href="/images/blog/gpg-and-github/github-gpg.png", title="Commit in GitHub signed by gpg">
  <img class='blog-image', data-index="2", alt="Commit in GitHub signed by gpg", src="/images/blog/gpg-and-github/github-gpg.png"/>
</a>

---
## How to set up git to use GPG with every commit

Just run 2 simple commands:

```bash
$ git config --global user.signingkey key-name
$ git config --global commit.gpgsign true
```
where `key-name` is the name of your GPG key.

Here is my <a href="https://keybase.io/rrott" target="_blank" rel="noopener noreferrer">GPG key</a> for secure communication with me ;)

---
"I hope you enjoyed this article. Please have a good day!!" (c)
