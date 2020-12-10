# config valid for current version and patch releases of Capistrano
lock "~> 3.14.1"

set :application, "lootauvore-front"
set :repo_url, "git@github.com:Cruder/Lootovore-front.git"

set :deploy_to, -> { "/data/#{fetch(:application)}" }

set :ssh_options, {
  forward_agent: true,
  keys: [
    File.join(ENV['HOME'], '.ssh', 'id_rsa')
  ]
}

set :keep_releases, 5

namespace :deploy do
  task :build, :roles => :web do
    run "mint build -e .env.production"
  end
end