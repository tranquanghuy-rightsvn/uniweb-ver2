set :stage, :production
set :rails_env, :production
set :deploy_to, "/deploy/apps/uniweb-ver2"
set :branch, :upgrade_v1
server "13.213.35.142", user: "huy", roles: %w(web app db)
