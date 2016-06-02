---
title: How to start using GitLab
short: How to start using GitLab
date:  2016-05-31 17:40 UTC
tags:  git, gitlab, github, repo
category: git
---
# How to start using GitLab as your additional Git remote server.

|  |  |  |
|:----:|:----:|:----:|
| <img class='pure-img-responsive' title="GitHub logo", alt="GitHub logo", src="/images/blog/start-using-gitlab/github-logo.png"/>| <img class='pure-img-responsive' title="GitLab logo", alt="GitLab logo", src="/images/blog/start-using-gitlab/gitlab-logo.png"/>   | <img class='pure-img-responsive' title="Bitbucket logo", alt="Bitbucket logo", src="/images/blog/start-using-gitlab/bitbucket-logo.png"/> |


Introducing GitLab to my friends/colleagues is causing me some concern because I have heard phrases like **"This will void all my logs in GitHub Issues"** or **"I'll loose all my PRs' history, that's not ok!..."**, but you know, it is not really true!

You don't have to switch everything and stop using GitHub(or BitBucket if you wish)! You may easily add GitLab as your second `remote` so all your commits will be available on both GitLab and GitHab, allowing you to use advantages of all the platforms!

## Adding a new remote to your git.

Here is the "magic" command:

```bash
$ git remote set-url --add origin git@gitlab.com:<username>/<repo>.git
```

After that, each time you push your changes all the commits will be sent to both remote servers.

>Note: You may add Bitbucket as well(or even your own private GitLab server) but the more remote servers you have the slowest push you get.

Let's see if we are ok:

```bash
$ git remote -v
origin  git@github.com:rrott/rrott.com.git (fetch)
origin  git@github.com:rrott/rrott.com.git (push)
origin  git@gitlab.com:rrott/rrott.com.git (push)
```

It means that your git client will fetch all the data from GitHub while pushes will go to both GitLab and GitHub.

If you want to set GitLab as the default one follow these steps, for example:

- 1. delete origin:

```bash
$ git remote remove origin

```

> Note: If you run `git remote -v` you'll see no origins anymore.

```bash
$ git remote -v
$
```

- 2. Add GitLab's repo as origin:

```bash
$ git remote add origin git@gitlab.com:rrott/rrott.com.git
```

- 3. Add GitHub's repo as additional origin:

```bash
$ git remote set-url --add origin  git@github.com:rrott/rrott.com.git
```

And here is the result:

```bash
$ git remote -v
origin  git@gitlab.com:rrott/rrott.com.git (fetch)
origin  git@gitlab.com:rrott/rrott.com.git (push)
origin  git@github.com:rrott/rrott.com.git (push)
```

---
| Commits in GitLab | Commits in GitHub |
|:--------------------------:|:--------------------:|
| <img class='pure-img-responsive' title="Commits in GitLab", alt="Commits in GitLab", src="/images/blog/start-using-gitlab/gitlab-commits.png"/> | <img class='pure-img-responsive' title="Commits in GitHub", alt="Commits in GitHub", src="/images/blog/start-using-gitlab/github-commits.png"/> |

> Notice how perfectly responsive designs work on both websites ;)

----

## Using GitLab's mirrors

Above looks like a **mirror** but it's technically not a mirror. It's just an additional remote server, and if your collaborators push something to GitHub you will not see these changes in GitLab
> To "fix" this, your collaborators have to configure their git clients the same way as you did.

It may be good if:

- you are the only one on the project, or
- all your collaborators were forced to configure their git clients this way, or
- you don't need other collaborators to use both GitLab and GitHUb simultaneously - it's just for your own needs.

In case you need everything to be mirrored, try using GitLab's cool feature named(surprise!) **Mirror**. This feature will synchronize git repo from GitHub or BitBucket once a commit is pushed.

Let's do that:

 1. Open your project on GitLab
 2. Go to Settings Page.
 <img class='pure-img-responsive' title="GitLab project settings page", alt="GitLab project settings page", src="/images/blog/start-using-gitlab/gitlab-project-settings.png"/> 

 3. Click on `Mirror Repository` menu item.
 4. Configure it to be a mirror or to use another server as a mirror as described on the page.
  <img class='pure-img-responsive' title="GitLab project mirror settings page", alt="GitLab project mirror settings page", src="/images/blog/start-using-gitlab/gitlab-project-mirror.png"/> 

Is it the same? No. It is *almost* the same, the only problem is that you will have to use your login/password here.

That's it! I believe these 2 tricks will help you or your organization with switching to such a great project as GitHub. Give it a try, I really suggest doing this!

Have a good day!
