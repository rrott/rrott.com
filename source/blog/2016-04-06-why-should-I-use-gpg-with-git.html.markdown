---
title: Why should I use git with GPG?
short: Why should I use git with GPG?
date:  2016-04-06 10:49 UTC
tags:  git, gpg, security, github
category: Security
---
# Why should I use git with GPG?
You probably missed this recent news from [GitHub](https://github.com/blog/2144-gpg-signature-verification) because it may sound like a marketing bullshit you can leave without. Actually, you can, but if you care about who exactly commits to your repo, you should not.

## What's it about?
### In short:

For example, one can scam his investors showing them that [Aaron Paterson](https://github.com/tenderlove) is one of the collaborators in the project and that's why they have to give more money =) 

Yes, it's just a funny example, but... you know.

![Aaron Patterson Commitst to my git](../images/blog/gpg-and-github/Aaron-Patterson-Commitst-to-my-git.png)

## A bit about GPG in Git and GitHub
>When you're building software with people from around the world, sometimes it's important to validate that commits and tags are coming from an identified source. Git supports signing commits and tags with GPG and starting today GitHub will show you when commits and tags are signed.

Git supports signing using GPG for about 3-4 years and it is really strange that GitHub and GitLab ignored this =(

>Signing Your Work
Git is cryptographically secure, but it’s not foolproof. If you’re taking work from others on the internet and want to verify that commits are actually from a trusted source, Git has a few ways to sign and verify work using GPG.

>[source](https://git-scm.com/book/uz/v2/Git-Tools-Signing-Your-Work)


## Proof of Concept

You can set user name and email for any your repo using simple `git config` command and you can take any:

```bash
$ git config user.name "Aaron Patterson"
$ git config user.email "tenderlove@github.com"
```

It's a standard git's behaviour: you will never be asked to verify your identity.

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

And here is the result in GitHub:
<a href="/images/blog/gpg-and-github/tender-love-commits.gif" target="_blank">Screencast: Aaron Patterson's commitst to my git</a>

Repo: <a href="https://github.com/rrott/gpg_test/commits/master/README.md" target="_blank">rrott/gpg_test</a>

---
## How to use GPG with git

Honestly, I am not going to describe each step as there are several manuals in GitHub, that has everything you need:

[All about GPG in github](https://help.github.com/categories/gpg/)

[Generating a GPG key](https://help.github.com/articles/generating-a-gpg-key/)

[Git Tools - Signing Your Work](https://git-scm.com/book/en/v2/Git-Tools-Signing-Your-Work)


If you don't have GPG key, use the following commands:

```bash
$ gpg --gen-key

$ gpg --list-secret-keys

$ gpg --armor --export roman.rott@gmail.com
```

And then add your newly created gpg key to GitHub.

Try to commit:

```bash
 git commit -S -am "Committed with GPG"
 ```

 That's it:

 ![Commit in GitHub signed by gpg](../images/blog/gpg-and-github/github-gpg.png)

"I hope you enjoyed this article. Please have a good day!!"