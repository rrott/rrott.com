server 'rrott.com', user: 'roman', roles: %w{web}
role :web, %w{roman@rrott.com}
set :stage, 'production'
set :ssh_options, {
  keys: %w(/home/roman/.ssh/id_rsa),
  forward_agent: false,
  auth_methods: %w(publickey)
}
