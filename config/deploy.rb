# config valid only for current version of Capistrano
lock '3.9.0'

set :application, "regensburg"
set :repo_url, "git@github.com:bushrakhalid786/RWB.git"
set :branch, :master
set :deploy_to, '/home/deploy/regensburg'
rsa_keys = [
  '~/.ssh/id_rsa'
]
rsa_key = ''
rsa_keys.each do |name|
  if File.exists?(File.expand_path(name))
    rsa_key = name
    break
  end
end
set :ssh_options, { forward_agent: true, keys: rsa_key, keys_only: false}



server '13.58.225.207', user: 'deploy', roles: %w{web app db}

set :pty, true
set :linked_files, %w{config/database.yml config/application.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
set :keep_releases, 5
set :rvm_type, :system
set :rvm_ruby_version, 'ruby-2.4.0' # Edit this if you are using MRI Ruby

set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"    #accept array for multi-bind
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_error.log"
set :puma_error_log, "#{shared_path}/log/puma_access.log"
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [4, 8]
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false

# before :deploy, :solr_stop
# after :deploy, :solr_symlink
# after :deploy, :solr_start
