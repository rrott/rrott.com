server 'rrott.com', user: 'roman', roles: %w{web}, primary: true
set :repository, "build"
set :use_sudo, false
set :rvm_ruby_version, '2.3.0'
set :rvm_roles, [:web]

role :web, %w{roman@rrott.com}
set :ssh_options, {
   keys: %w(/Users/roman/.ssh/id_rsa),
   forward_agent: false,
   auth_methods: %w(publickey)
 }

after "deploy:updated", "deploy:build_site"
