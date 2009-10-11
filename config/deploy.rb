set :application, "tarx"

role :app, "tarx.panter.ch"
role :web, "tarx.panter.ch"
role :db,  "tarx.panter.ch", :primary => true
set :rails_env, 'production'

set :deploy_via, :remote_cache
set :git_enable_submodules, 1
set :scm, :git
set :repository,  "git@github.com:panter/tarx.git"
set :ssh_options, {:forward_agent => true}
set :deploy_to, "/home/tarx/tarx"
set :user, "tarx"
set :use_sudo,    false

task :update_links, :roles => [:app] do
  run "ln -sf #{shared_path}/config/* #{release_path}/config/"
  run "ln -sf #{shared_path}/db/*.sqlite3 #{release_path}/db/"
end
after "deploy:update_code", :update_links

namespace :deploy do
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end
