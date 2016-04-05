set :stage,        :production
set :rails_env,    :production
set :deploy_to,    '/home/developer/declarations'
set :unicorn_init, '/etc/init.d/declarations_unicorn'

server '193.124.176.90', user: 'developer', port: 2244, roles: %w{app web db}

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :sudo, fetch(:unicorn_init), :restart
    end
  end

  task :start do
    on roles(:app), in: :sequence, wait: 5 do
      execute :sudo, fetch(:unicorn_init), :start
    end
  end

  task :stop do
    on roles(:app), in: :sequence, wait: 5 do
      execute :sudo, fetch(:unicorn_init), :stop
    end
  end

  after :publishing, :restart
  after :finishing, :cleanup
end

namespace :deploy do
  desc "Update crontab with whenever"
  task :update_cron do
    on roles(:app) do
      within current_path do
        execute :bundle, :exec, "whenever --update-crontab #{fetch(:application)}"
      end
    end
  end

  after :finishing, 'deploy:update_cron'
end
