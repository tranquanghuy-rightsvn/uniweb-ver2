lock "3.17.1"

set :application, "uniweb-ver2"
set :repo_url, "git@github.com:tranquanghuy-rightsvn/uniweb-ver2.git"
set :pty, true
set :linked_files, %w(config/database.yml config/application.yml)
set :linked_dirs, %w(log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads)
set :keep_releases, 5
set :rvm_type, :user
set :rvm_map_bins, %w{gem rake ruby rails bundle puma pumactl}
set :rvm_ruby_version, '3.0.3'
set :use_sudo, true

set :default_env, {
  PATH: '$HOME/.nvm/versions/node/v16.20.2/bin/:$PATH'
}
set :puma_rackup, -> {File.join(current_path, "config.ru")}
set :puma_state, -> {"#{shared_path}/tmp/pids/puma.state"}
set :puma_pid, -> {"#{shared_path}/tmp/pids/puma.pid"}
# set :puma_bind, -> {"unix://#{shared_path}/tmp/sockets/puma.sock"}
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_conf, -> {"#{shared_path}/puma.rb"}
set :puma_access_log, -> {"#{shared_path}/log/puma_access.log"}
set :puma_error_log, -> {"#{shared_path}/log/puma_error.log"}
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, "production"))
set :puma_threads, [0, 8]
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false
