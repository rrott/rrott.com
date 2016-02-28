---
title: Setting Up Rails 5 API App with ActiveAdmin
date: 2016-02-28 15:44 UTC
tags: rails, rails5, ActiveAdmin, api, Admin panel, rails-api
category: ror

---
#Setting Up Rails 5 API Only App with ActiveAdmin enabled

A new version of [Rails 5.0 betta 3](http://weblog.rubyonrails.org/2016/2/27/Rails-5-0-beta3/) has been released several days ago, the RC1 version is to be shipped on March 1 and the final on March 16 and it means that we can start playing with it right now! Yay!! 

As you may probably know **rarails-api** gem is now shipped with rails 5 by default. It means that we can create beautifull Api services using reils without any doubt =) 

**If you missed the announcement on what’s new in Rails 5, checkout the [rails 5.0.0 anounce](http://weblog.rubyonrails.org/2015/12/18/Rails-5-0-beta1/)**
>Rails is ... a great companion for the new crop of client-side JavaScript or native applications that just needs the backend to speak JSON. We’ve made this even clearer now with the new –api mode. If you create a new Rails application using rails new backend --api, you’ll get a slimmed down skeleton and configuration that assumes you’ll be working with JSON, not HTML.

Generating an API application stripes down Rails a lot, disabeling views, flash messages, cookies, and more more, but `ActiveAdmin` can still be plugged into it with a bit of tweaking. So here is the steps on how to create a new Rails-5 Api application with ActiveAdmin integration:

##Setting Up Rails Api
1. Make sure you have installed Ruby 2.2.2 or newer as it is required by Rails 5. I use Ruby 2.3.0 as it was [recently released](https://www.ruby-lang.org/en/news/2015/12/25/ruby-2-3-0-released/) and I want to try it out.

    ```
    $ rvm list
    rvm rubies
       ruby-1.9.3-p551 [ x86_64 ]
       ruby-2.1.7 [ x86_64 ]
     * ruby-2.2.4 [ x86_64 ]
    => ruby-2.3.0 [ x86_64 ]
    
      # => - current
      # =* - current && default
      #  * - default
    ```
2. Rails 5 hasn’t been officially released yet so we have to clone Rails from its GitHub repository(`master` branch):

  ```
    $ git clone git@github.com:rails/rails.git
  ```  

3. Go into the newly cloned rails dir, and run the `bundle` command. 

  ```
    $ bundle install    
  ```

4. To start building a new Rails API project, we need to generate it by passing the `--api` parameter to the `rails new` command:

  ```
  $ bundle exec railties/exe/rails new ../new_api_app --api --edge

  ```
  
  > Note, I am running this command from the directory  where cloned version of rails is located. It means I have to put an additional param with the directory name started from `../` to put newly generated application into a place above current wd. `../new_api_app` in this case.

5. The next step is to cd into directory of your new rails Api application and run `bundle` and `rake db:setup` to install all the necessary gems and setup the database:
  
  ```
    $ cd ../new_api_app
    $ bundle install
    $ bin/rake db:setup
  ```
  >Note that I am using `bin/rake`(and will be using `bin/rails` in the next steps) cause this version of rails was not installed globablly and the full path to apropriate binnary should be used.
  
  Now we have a new tiny-tyne API only Rails application without tons of Front-end related stuff that is useless in case of API apps.

6. The very next step would be installing and setting up `RSpec`, adding tests and may be a `factory_girl` for creating factories, etc, but this part is out of my theme. 
  > The same is for scafolding and generating new resources, but you will probably note that when an app is created with the `--api` flag generator will not create views and only api-related recources are created, e.g.:

  ```
  $ bin/rails g scaffold user
  Running via Spring preloader in process 55287
      invoke  active_record
      create    db/migrate/20160228093108_create_users.rb
      create    app/models/user.rb
      invoke    rspec
      create      spec/models/user_spec.rb
      invoke      factory_girl
      create        spec/factories/users.rb
      invoke  resource_route
       route    resources :users
      invoke  serializer
      create    app/serializers/user_serializer.rb
      invoke  scaffold_controller
      create    app/controllers/users_controller.rb
      invoke    rspec
      create      spec/controllers/users_controller_spec.rb
      create      spec/routing/users_routing_spec.rb
      invoke      rspec
      create        spec/requests/users_spec.rb
  ```
  
## Setting Up ActiveAdmin 

Even thought Rails 5 API allows us to get rid of senseless Rails' Front-End parts, generating a new project using `--api` param, we can easely integrate ActiveAdmin into it.

They did it by having base API controller inherit from `ActionController::API` instead of `ApplicationController` so integrating ActiveAdmin is as easy as setting `ApplicationController` to be inherited from `ActionController::Base`. 
> Note, we also need to include several classes to the middleware to make it working.
 
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
2. Update `config/application.rb` file to include necessary for ActiveAdmin classes, such as `ActionDispatch::Flash`, `Rack::MethodOverride`, `ActionDispatch::Cookies`
 
  ```ruby
    module NewApiApp
      class Application < Rails::Application
        # ...
        config.middleware.use ActionDispatch::Flash
        config.middleware.use Rack::MethodOverride
        config.middleware.use ActionDispatch::Cookies
      end
    end
  ```

> Note: This way your main application code is still API only with all its benefits but you will be able to use ActiveAdmin and it should work as expected.

###Install ActiveAdmin
1. Add ActiveAdmin to your `Gemfile`:

  ```ruby
    gem 'activeadmin', github: 'activeadmin'
  ```
  
2. ActiveAdmin master has preliminary support for Rails 5 and to give it a try, these Gems should be installed:

  ```ruby
    gem 'devise',      '> 4.x'
    gem 'rspec-rails', '>= 3.5.0.beta1'
    gem 'ransack',    github: 'activerecord-hackery/ransack'
    gem 'kaminari',   github: 'amatsuda/kaminari', branch: '0-17-stable'
    gem 'formtastic', github: 'justinfrench/formtastic'
    gem 'draper',     github: 'audionerd/draper', branch: 'rails5', ref: 'e816e0e587'

    # To fix a Draper deprecation error
    gem 'activemodel-serializers-xml', github: 'rails/activemodel-serializers-xml'

    # Optional -- only if you already include these gems
    gem 'rack-mini-profiler',          github: 'MiniProfiler/rack-mini-profiler'
    gem 'database_cleaner',            github: 'pschambacher/database_cleaner', branch: 'rails5.0', ref: '8dd9fa4'
```

3. Update gems using bundler:

  ```
    $ bundle install
  ```
  
4. After installing the gems, you need to run the generator.
  
  ```
    $ bin/rails g active_admin:install
  ``` 
  > Here are another options, like setting it to use an existing user class: [activeadmin/docs/0-installation.md](https://github.com/activeadmin/activeadmin/blob/master/docs/0-installation.md)

5. Update your migrations and start rails to the results:
  
  ```
    $ rake db:migrate
    $ rake db:seed
    $ rails server
  ```

  Visit http://localhost:3000/admin and log in as the default user:

  **User:** admin@example.com
  **Password:** password
  
  ![Image of Rails 5 API application with ActiveAdmin enabled](/images/blog/rails5-api-active-admin/active-admin-with-rails5.png)
That it. =)
