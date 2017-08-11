desc 'Start SOLR'
task :solr_start do
  on roles(:all) do
    within release_path do
      with :rails_env => fetch(:rails_env) do
        execute :rake, 'sunspot:solr:start', raise_on_non_zero_exit: false
      end
    end
  end
end
