# app_root = '/eqms'
# pidfile "#{app_root}/tmp/pids/puma.pid"
# state_path "#{app_root}/tmp/pids/puma.state"
# stdout_redirect "#{app_root}/log/puma.stdout.log", "#{app_root}/log/puma.stderr.log", true
daemonize false
port 3000
environment ENV.fetch("RAILS_ENV") { "development" }
# if Rails.env.production?
#   workers 4
#   threads 4, 10
# else
#   workers 2
#   threads 4, 7
# end
workers 1
threads 5, 7
preload_app!

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end

before_fork do
  ActiveRecord::Base.connection_pool.disconnect!

  # PumaWorkerKiller.enable_rolling_restart # Default is every 6 hours
end
