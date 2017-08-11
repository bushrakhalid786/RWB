desc 'Make a Symlink for SOLR'
task :solr_symlink do
  on roles(:all) do
    within release_path do
      with :rails_env => fetch(:rails_env) do
        execute "ln -s /data/close.by/ror/shared/solr /data/close.by/ror/#{fetch(:rails_env)}/current/solr"
      end
    end
  end
end