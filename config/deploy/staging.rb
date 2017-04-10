server '46.101.119.187', user: 'roman', roles: %w{web}, primary: true
set :repository, "build"
set :use_sudo, false
set :rvm_ruby_version, '2.3.4'
set :rvm_roles, [:web]

role :web, %w{roman@46.101.119.187}
set :ssh_options, {
  keys: %w(~/.ssh/id_rsa),
  forward_agent: false,
  auth_methods: %w(publickey)
}

after  "deploy:updated", "deploy:build_site"
