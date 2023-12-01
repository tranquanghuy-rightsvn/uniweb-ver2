set :stage, :production
set :rails_env, :production
set :deploy_to, "/deploy/apps/uniweb-ver2"
set :branch, :upgrade_v1
server "52.77.249.108", user: "louis", roles: %w(web app db)
