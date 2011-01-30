# RVM bootstrap
$:.unshift(File.expand_path("~/.rvm/lib"))
require 'rvm/capistrano'
set :rvm_ruby_string, 'ree'
set :rvm_type, :user

# main details
set :application, "hooopo.com:50022"
role :web, "hooopo.com:50022"
role :app, "hooopo.com:50022"
role :db,  "hooopo.com:50022", :primary => true

# server details
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_to, "/var/www/si9n"
set :deploy_via, :remote_cache
set :user, "root1"
set :use_sudo, false

# repo details
set :scm, :git
set :scm_username, "root1"
set :repository, "git://github.com/hooopo/si9n.git"
set :branch, "master"
set :git_enable_submodules, 1

# runtime dependencies
depend :remote, :gem, "bundler", ">=1.0.0.rc.2"

# tasks
namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Symlink shared resources on each release"
  task :symlink_shared, :roles => :app do
    #run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'

namespace :bundler do
  desc "Symlink bundled gems on each release"
  task :symlink_bundled_gems, :roles => :app do
    run "mkdir -p #{shared_path}/bundled_gems"
    run "ln -nfs #{shared_path}/bundled_gems #{release_path}/vendor/bundle"
  end

  desc "Install for production"
  task :install, :roles => :app do
    run "cd #{release_path} && bundle install --deployment"
  end

end

after 'deploy:update_code', 'bundler:symlink_bundled_gems'
after 'deploy:update_code', 'bundler:install'


#default_run_options[:pty] = true  # Must be set for the password prompt from git to work
#set :repository, "git@github.com:vanpelt/rails-app.git"  # Your clone URL
#set :scm, "git"
#set :user, "root1"  # The server's user for deploys
#set :scm_passphrase, "ocnc123"  # The deploy user's password
#set :deploy_via, :remote_cache
#set :application, "si9n"
#set :repository,  "git://github.com/hooopo/si9n.git"
#
##set :scm, :subversion
### Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
##
#role :web, "hooopo.com:50022"                          # Your HTTP server, Apache/etc
#role :app, "hooopo.com:50022"                          # This may be the same as your `Web` server
#role :db,  "hooopo.com:50022", :primary => true # This is where Rails migrations will run
###role :db,  "your slave db-server here"
#
## If you are using Passenger mod_rails uncomment this:
## if you're still using the script/reapear helper you will need
## these http://github.com/rails/irs_process_scripts
#
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end