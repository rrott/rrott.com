---
title: Deploying middleman driven website using capistrano
short: Deploying middleman driven website using capistrano
date:  2016-04-04 20:17 UTC
tags:  capistrano, middleman, cap, deploy, devops
category: devops
--- 

Step 1: add capistrano to your project following their official manuel:
https://github.com/capistrano/capistrano

Add Capistrano to your project's Gemfile:

group :development do
  gem "capistrano", "~> 3.4"
end

Then run Bundler to ensure Capistrano is downloaded and installed:

$ bundle install

$ bundle exec cap install

To customize the stages that are created, use:

$ bundle exec cap install STAGES=sandbox,production