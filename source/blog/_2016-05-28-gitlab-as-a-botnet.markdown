---
title: GitLab As A Botnet Service
short: GitLab as a botnet service
date: 2016-05-28 07:52 UTC
tags: security, GitLab, bot, botnet, telegram
category: security
---
# GitLab As A botnet Service

>
## Disclaimer:
- This blog post is to inform the community about the problem. Do not abuse GitLab servers!
- I did nothing against GitLab infrastructure and will newer do =)
- There is no instruction on how to create botnets in this article. LOL

I am writing this just to show how awesome [GitLab](https://gitlab.com) is and how it is easy for hackers to use their infrastructure.

I am not going to provide you step-by-step instruction on how to create botnets in this article: first of all if you are skilled enough to write your own botnet you do not need it; if you are not - google.

## The "botnet"
You may probably miss recent updates in GitLab world, but [they partner with DigitalOcean](https://about.gitlab.com/2016/04/19/gitlab-partners-with-digitalocean-to-make-continuous-integration-faster-safer-and-more-affordable/) to make their Continuous Integration better. It is really cool and I prefer using GitLab's CI instead of Jenkins. The cool feature of it is that you may run any server build from docker image using their own servers.

### 1. Prepare CI
Let's prepare our server. For this, we need to create a new `.gitlab-ci.yml` file and put it in the root of your project. e.g.:

```yaml
image: ruby:2.3.1

before_script:
  - bundle install

stages:
  - bot

first_bot:
  stage: bot
  script:
    - bundle exec ruby main.rb
second_bot:
  stage: bot
  script:
    - /bin/bash botnet_runner.sh
...
```

In above script, you ask CI to use `ruby` docker image with ruby version 2.3.1
Then ask it to run `bundle install` to be run before all other tasks. There you can add any other commands, like installing applications, fetching necessary files and keys, etc.
Next step is to define stages that can be different for different runners.
And finally, we will add runners that can execute their own scripts in separate isolated servers.

### 2. Creating "botnet"
As It was mentioned above, my script has nothing to do with botnets. It just exists =)

**main.rb**:

```ruby
require './telegram'
require './what_is_my_ip'

whois = WhatIsMyApi.new
telegram = TelegramBot.new
telegram.inform whois.info
```

**what\_is\_my\_ip.rb**:

```ruby
require 'capybara'
require 'capybara/poltergeist'
require 'capybara/dsl'

class WhatIsMyApi
  include Capybara::DSL

  def initialize
    Capybara.javascript_driver = :poltergeist
    Capybara.register_driver :poltergeist do |app|
      Capybara::Poltergeist::Driver.new(app, js_errors: true, timeout: 30)
    end
  end

  def info
    visit "https://www.whatismyip.com/"
    page.find('[class="ip-box-left"]').text
  end
end
```

**telegram.rb**:

```ruby
require 'telegram/bot'

class TelegramBot
  def initialize
    @token = 'Your bot token'
    @chat_id = '@your_chat'
  end

  def inform(message)
    Telegram::Bot::Client.run(@token) do |bot|
      bot.api.send_message(
        chat_id: @chat_id,
        text: "Hello, roman. #{message} is here"
      )
    end
  end
end
```

[Here](https://gitlab.com/rrott/gitlab-botnet) you can find the sources.

**[Telegram](https://telegram.org/)** is a cloud-based instant messaging service with end-to-end encrypted messaging and easy to use bots integration.
In above example, I use capybara to open `whatismyip.com` website, parse the answer and send a message to my own Telegram channel. This channel can be a point for several bots to talk each other and perform all the actions.

### 3. Results

### 4. Scenarios
#### Scenario #1
1. Once a server is ready a new bot client informs others about the server sending messages to an encrypted chat channel.
2. Another bot, that reads this channel answers with the list of victims(e.g. LinkedIns accounts)
3. The first bot runs a script that uses provided list and updates others with the result.
...

#### Scenario #2
1. You write a new message into your encrypted chat channel. something like `/spam_twitter "Message"`
2. Your bot reacts to this request creating dozens of servers on GitLab CI each 2 minutes
3. Once a server is ready it asks for log/password and sends this message in a new tweet after login in.
...

> Note: All above are just examples, but actually that's how spammers work.

----

## FAQ
Your code is getting IP of servers. It's not a botnet!

 - That's right. This article is not about writing botnets.

How big can it be?

- Their blog says that they have 12-150 machines created "on demand" and running at once(an average of 54 machines running in parallel). So, it looks like a number of servers can be as much big as one may need.

>
All your builds run on Digital Ocean 4GB instances, with CoreOS and the latest Docker Engine installed.
Your builds will always be run on fresh machines. This will effectively eliminate possible security issues as there is no potential of breaking out of the container.

What applications I can run, what OS?

- GitLab CI uses Docker Engine to test and build any application according to their [manuals](https://gitlab.com/help/ci/docker/using_docker_images.md). It means you can use any app available on [Docker Hub](https://hub.docker.com/) even your own.

>
**Multi-platform:** you can execute builds on Unix, Windows, OSX, and any other platform that supports Go.
>
**Multi-language:** build scripts are command line driven and work with Java, PHP, Ruby, C, and any other language.

I have to push updates to GitLab each time I want my bots to be run, right?

- No. You can use their [API](https://gitlab.com/help/ci/triggers/README.md) to build and run your servers.

How we can protect GitLab from this?

- I have no answer to this question =( They may implement some monitoring system to find and ban abusers.

Does it mean that GitLab doesn't care about security?

- No, they do. They release patches and new security updates regularly and you may follow this [article](https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/blob/master/docs/security/index.md) to find more info on how to protect your runners.

I am not a hacker, I am a developer, so what I need all this information for?

## Read more about GitLab
- [GitLab Continuous Integration](https://about.gitlab.com/gitlab-ci/)
- [GitLab Runner 1.1 with Autoscaling](https://about.gitlab.com/2016/03/29/gitlab-runner-1-1-released/)
- [GitLab Container Registry](https://about.gitlab.com/2016/05/23/gitlab-container-registry/)
- [Getting started with CI in GitLab](https://about.gitlab.com/2016/04/20/webcast-recording-and-slides-introduction-to-ci-in-gitlab/). Webcast Recording and Slides
