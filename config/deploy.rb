# config valid only for current version of Capistrano
lock '3.8.0'

set :application, 'rrott.com'
set :repo_url,    'git@gitlab.com:rrott/rrott.com.git'
set :deploy_to,   '/home/roman/rrott.com'
set :log_level, :info

# set :rvm_ruby_string, 'ruby-2.4.1'
# set :rvm_binary,      '~/.rvm/bin/rvm'
# set :rvm_tsype, :user
set :scm, :middleman
set :keep_filesystem_permissions, false
desc "See uptime on server"
task :uptime do
  on roles(:all) do |host|
    uptime = capture(:uptime)
    puts "#{host.hostname} reports: #{uptime}"
  end
end

namespace :deploy do
  desc "Build and deploy"
  task :build_site do
    on roles(:all) do
      wd = fetch(:release_path)
      within "#{wd}" do
        # execute "tar -xjvf build.tar.gz"
        execute "mv #{wd}/build #{wd}/public"
      end
    end
  end
end
