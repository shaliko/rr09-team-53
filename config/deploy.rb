default_run_options[:pty] = true

set :application, "dochub"
set :repository,  "git@github.com:railsrumble/rr09-team-53.git"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/rails_app/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
set :user, "rails_app"
set :branch, "master"

set :use_sudo, false

role :app, "74.207.244.192"
role :web, "74.207.244.192"
role :db,  "74.207.244.192", :primary => true

#after "deploy:symlink", "deploy:update_crontab"

namespace :deploy do

  desc "Shared files"
  task :before_symlink, :roles => :app do
    run "mkdir -p #{shared_path}/db"
    run "rm -drf #{release_path}/db/production.sqlite3"
    run "ln -s #{shared_path}/db/production.sqlite3 #{release_path}/db/production.sqlite3"
  end

  desc "Copy production configuration"
  task :after_symlink, :roles => [:app, :db, :web] do
    #copy config
    run "cp #{current_path}/config/deploy/database.yml #{current_path}/config/database.yml"
    run "cp #{current_path}/config/deploy/settings.yml #{current_path}/config/settings.yml"
  end

  desc "Restart Passenger"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Tail production log"
  task :tail_log, :roles => :app do
    stream "tail -f #{shared_path}/log/production.log"
  end

end
