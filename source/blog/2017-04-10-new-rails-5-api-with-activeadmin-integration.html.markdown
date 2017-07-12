---
title: Rails 5 API with ActiveAdmin(updated manual)
short:
date: 2017-04-10 12:44 UTC
tags: rails, rails5, ActiveAdmin, api, Admin panel, rails-api, RoR, ror
category: RoR

---

#Setting Up Rails 5 API Only App with ActiveAdmin(updated manual).
*You can also find [my outdated post about using ActiveAdmin with Rails 5.0 beta 3](/blog/ror/rails-5-api-with-activeadmin-integration.html).

As you may probably know **rails-api** gem is now shipped with rails 5 by default. It means we can create beautiful API services using rails without any doubt =)

If you missed the announcement on **what’s new in Rails 5**, checkout the [rails 5.0.0 anounce:](http://weblog.rubyonrails.org/2016/6/30/Rails-5-0-final/)**
>Rails is ... a great companion for the new crop of client-side JavaScript or native applications that just needs the backend to speak JSON. We’ve made this even clearer now with the new –api mode. If you create a new Rails application using rails new backend --api, you’ll get a slimmed down skeleton and configuration that assumes you’ll be working with JSON, not HTML.

Generating an API application stripes down Rails a lot, disabling views, flash messages, cookies, and more more, but `ActiveAdmin` can still be plugged into it with a bit of tweaking. So here is the steps on how to create a new Rails-5 API application with ActiveAdmin integration:

##Setting Up Rails Api

1. Make sure you have installed any latest stable Ruby version as 2.2.2 or newer is required by Rails 5. I usually use Ruby 2.3.4.

    ```bash
      $ rvm list
        rvm rubies
            ruby-1.9.3-p551 [ x86_64 ]
            ruby-2.2.7 [ x86_64 ]
      => ruby-2.3.4 [ x86_64 ]
      *     ruby-2.4.1 [ x86_64 ]
    ```

    You also need to have rails 5 installed on your machine:

    ```bash
      $ rails --version
        Rails 5.0.2
    ```

    if it is not, just install it using `gem install rails` command)

    ```bash
      $ gem install rails
        Successfully installed rails-5.0.2
        Parsing documentation for rails-5.0.2
        Installing ri documentation for rails-5.0.2

        Done installing documentation for rails after 0 seconds
        1 gem installed
    ```

2. To start building a new Rails API project, we need to generate it by passing the `--api` parameter to the `rails new` command:

    ```bash
      $ rails new new_api_app --api
    ```
    Now we have a new tiny-tyne API only Rails application without tons of Front-end related stuff that is useless in case of API apps. The very next step is installing and setting up `RSpec`, adding tests, scaffolding resources, etc, etc, but this is out of the scope.
    > You may probably noted that when an app is created with the `--api` flag, generator did not create views but only api-related resources, e.g.:

    ```bash
      $ cd ./new_api_app
      $ rails g scaffold user
        Running via Spring preloader in process 72885
              invoke  active_record
              create    db/migrate/20170410101135_create_users.rb
              create    app/models/user.rb
              invoke    test_unit
              create    test/models/user_test.rb
              create    test/fixtures/users.yml
              invoke    resource_route
              route      resources :users
              invoke    scaffold_controller
              create    app/controllers/users_controller.rb
              invoke    test_unit
              create    test/controllers/users_controller_test.rb
    ```

---
## Adding ActiveAdmin to Rails 5 API app

Even thought Rails 5 API allows us to get rid of senseless Rails' Front-End parts, we can easily integrate ActiveAdmin into it. We do it by making our `ApplicationController` to be inherited from `ActionController::Base` instead of `ActionController::API`. We will also need to include several classes to the middleware to make it working.

Let's do it!

###Prepare Rails API application.
1. Update your `application_controller.rb` file.

    before:

    ```ruby
      class ApplicationController < ActionController::API
        # your code here
      end
    ```

    after:

    ```ruby
      class ApplicationController < ActionController::Base
        # your code here
      end
    ```

    > I can also suggest creating a new base controller class for the API that inherits from ActionController::API to separate API and your Admin Panel - Just add a new `ApiController < ActionController::API` class and use it for all the API-specific logic.

2. Update `config/application.rb` file to include necessary for ActiveAdmin `ActionDispatch::Flash`, `Rack::MethodOverride` and `ActionDispatch::Cookies` to be able to show flash notifications and use Devise.

    ```ruby
      module NewApiApp
        class Application < Rails::Application
          # ...
          config.middleware.use ActionDispatch::Flash
          config.middleware.use Rack::MethodOverride
          config.middleware.use ActionDispatch::Cookies
          config.middleware.use ActionDispatch::Session::CookieStore
        end
      end
    ```

    > Note: This way your main application code is still API only with all its benefits but you will be able to use ActiveAdmin and it should work as expected.

3. Add ActiveAdmin and Devise to your `Gemfile`:

    ```ruby
      source 'https://rubygems.org'
      # ...
      gem 'activeadmin', github: 'activeadmin'
      gem 'devise', '> 4.x'
    ```

4. Update gems using bundler and run the generator.

    ```bash
      $ bundle install
      $ rails g active_admin:install
    ```

5. Update your migrations and start rails to see the results:

    ```bash
      $ rails db:migrate
      $ rails db:seed
      $ rails server
    ```

    Visit http://localhost:3000/admin and log in as the default user:

    **User:** admin@example.com
    **Password:** password

  <a href="/images/blog/rails5-api-active-admin/active-admin-with-rails5.png", title="Image of Rails 5 API application with ActiveAdmin enabled">
    <img class='blog-image', data-index="0", alt="Image of Rails 5 API application with ActiveAdmin enabled", src="/images/blog/rails5-api-active-admin/active-admin-with-rails5.png"/>
  </a>

That's it. =)
> Don't forget to isolate your admin panel from API to protect it from attacks ;)
