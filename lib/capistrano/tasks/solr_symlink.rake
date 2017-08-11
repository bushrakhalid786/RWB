desc 'Make a Symlink for SOLR'
task :solr_symlink do
  on roles(:all) do
    within release_path do
      with :rails_env => fetch(:rails_env) do
      end
    end
  end
end