#!/usr/bin/env puma

directory '/home/deploy/regensburg/current'
rackup "/home/deploy/regensburg/current/config.ru"
environment 'production'
daemonize true

tag ''

pidfile "/home/deploy/regensburg/shared/tmp/pids/puma.pid"
state_path "/home/deploy/regensburg/shared/tmp/pids/puma.state"
stdout_redirect '/home/deploy/regensburg/shared/log/puma_error.log', '/home/deploy/regensburg/shared/log/puma_access.log', true

threads 4,8

bind 'unix:///home/deploy/regensburg/shared/tmp/sockets/puma.sock'

workers 0
prune_bundler

on_restart do
  puts 'Refreshing Gemfile'
  ENV["BUNDLE_GEMFILE"] = "/home/deploy/regensburg/current/Gemfile"
end