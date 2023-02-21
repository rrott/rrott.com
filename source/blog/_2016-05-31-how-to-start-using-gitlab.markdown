---
title: How to start using GitLab
short: How to start using GitLab
date: 2016-05-31 17:40 UTC
tags: git, gitlab, github, repo
category: git
---
# How to start using GitLab as your additional Git remote server.


<p class='flex wrap'>
  <img class='responsive', alt="GitHub logo", src="/images/blog/start-using-gitlab/git.png"/>
</p>

Introducing GitLab to my friends/colleagues is causing me some concern because I have heard phrases like **"This will void all my logs in GitHub Issues"** or **"I'll loose all my PRs' history, that's not ok!..."**, but you know, it is not really true!

You don't have to switch everything and stop using GitHub(or BitBucket if you wish)! You may easily add GitLab as your second `remote` so all your commits will be available on both GitLab and GitHab, allowing you to use advantages of all the platforms!

## Adding a new remote to your git.

Here is the "magic" command:

```bash
$ git remote set-url --add origin git@gitlab.com:<username>/<repo>.git
```

After that, each time you push your changes all the commits will be sent to both remote servers.

>Note: You may add Bitbucket as well(or even your own private GitLab server) but the more remote servers you have the slower push will be.

Let's see if we are ok:

```bash
$ git remote -v
origin  git@github.com:rrott/rrott.com.git (fetch)
origin  git@github.com:rrott/rrott.com.git (push)
origin  git@gitlab.com:rrott/rrott.com.git (push)
```

It means that your git client will fetch all the data from GitHub while pushes will go to both GitLab and GitHub.

If you want to set GitLab as the default one follow these steps, for example:

1. delete origin:

    ```bash
    $ git remote remove origin
    ```

    > Note: If you run `git remote -v` you'll see no origins anymore.

    ```bash
    $ git remote -v
    ```
2. Add GitLab's repo as origin:

    ```bash
    $ git remote add origin git@gitlab.com:rrott/rrott.com.git
    ```

3. Add GitHub's repo as additional origin:

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



<a href="/images/blog/start-using-gitlab/gitlab-commits.png", title="Commits in GitLab">
  <img class='blog-image', data-index="0", alt="Commits in GitLab", src="/images/blog/start-using-gitlab/gitlab-commits.png"/>
</a>

<a href="/images/blog/start-using-gitlab/github-commits.png", title="Commits in GitHub",>
  <img class='blog-image', data-index="1", alt="Commits in GitHub", src="/images/blog/start-using-gitlab/github-commits.png"/>
</a>


> Notice how perfectly responsive designs work on both websites ;)

----

```bash
$ git push
Counting objects: 11, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (11/11), done.
Writing objects: 100% (11/11), 41.90 KiB | 0 bytes/s, done.
Total 11 (delta 7), reused 0 (delta 0)
To git@gitlab.com:rrott/rrott.com.git
   2cccd71..5cb6e9f  master -> master

Counting objects: 11, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (11/11), done.
Writing objects: 100% (11/11), 41.90 KiB | 0 bytes/s, done.
Total 11 (delta 7), reused 0 (delta 0)
To git@github.com:rrott/rrott.com.git
   2cccd71..5cb6e9f  master -> master
```

## Using GitLab's mirrors

Above looks like a --mirror-- but it's technically not a mirror. It's just an additional remote server, and if your collaborators push something to GitHub you will not see these changes in GitLab
> To "fix" this, your collaborators have to configure their git clients the same way as you did.

It may be good if:

- you are the only one on the project, or
- all your collaborators were forced to configure their git clients this way, or
- you don't need other collaborators to use both GitLab and GitHUb simultaneously - it's just for your own needs.

In case you need everything to be mirrored, try using GitLab's cool feature named(surprise!) **Mirror**. This feature will synchronize git repo from GitHub or BitBucket once a commit is pushed.

Let's do that:

 1. Open your project on GitLab
 2. Go to Settings Page.
  <a href="/images/blog/start-using-gitlab/gitlab-project-settings.png", title="GitLab project settings page">
    <img class='blog-image', data-index="2", alt="GitLab project settings page", src="/images/blog/start-using-gitlab/gitlab-project-settings.png"/>
  </a>

 3. Click on `Mirror Repository` menu item.
 4. Configure it to be a mirror or to use another server as a mirror as described on the page.
  <a href="/images/blog/start-using-gitlab/gitlab-project-mirror.png", title="GitLab project mirror settings page">
    <img class='blog-image', data-index="3", alt="GitLab project mirror settings page", src="/images/blog/start-using-gitlab/gitlab-project-mirror.png"/>
  </a>

Is it the same? No. It is *almost* the same, the only problem is that you will have to use your login/password here.

That's it! I believe these 2 tricks will help you or your organization with switching to such a great project as GitHub. Give it a try, I really suggest doing this!
