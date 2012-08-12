require 'rvm/capistrano'
set :rvm_ruby_string, 'default'
set :rvm_type, :system

require "bundler/capistrano"

set :application, "test.teamrvinc.com"
set :repository,  "~/Sites/#{application}/.git"

set :user, "webadmin"
set :use_sudo, false

set :scm, :git
set :branch, "master"

role :web, "#{application}"                          # Your HTTP server, Apache/etc
role :app, "#{application}"                          # This may be the same as your `Web` server
role :db,  "#{application}", :primary => true # This is where Rails migrations will run

set :deploy_to, "/var/www/#{user}/data/www/#{application}"
set :deploy_via, :copy

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"
set :keep_releases, 1

#If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end