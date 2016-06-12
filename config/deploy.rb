# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'rrott.com'
set :repo_url,    'git@gitlab.com:rrott/rrott.com.git'
set :deploy_to,   '/var/www/rrott.com'
#set :log_level, :info

set :rvm_ruby_string, 'ruby-2.3.1'
set :rvm_binary,      '~/.rvm/bin/rvm'
set :rvm_type, :user

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
        execute :bundle, :exec, "middleman build"
        execute "cp #{wd}/source/favicon/*.* #{wd}/build"
        execute "mv #{wd}/build #{wd}/public"
      end
    end
  end
end


