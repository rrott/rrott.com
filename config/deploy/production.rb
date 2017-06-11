server '165.227.136.77', user: 'roman', roles: %w{web}, primary: true
set :repository, "build"
set :use_sudo, false
# set :rvm_ruby_version, '2.4.1'
# set :rvm_roles, [:web]

role :web, %w{roman@165.227.136.77}
set :ssh_options, {
  keys: %w(~/.ssh/id_rsa),
  forward_agent: false,
  auth_methods: %w(publickey)
}

after  "deploy:updated", "deploy:build_site"
