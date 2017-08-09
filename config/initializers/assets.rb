# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( application/* )
# Rails.application.config.assets.precompile += [/(^[^_\/]|\/[^_])[^\/]*$/]

Rails.application.config.assets.precompile += %w(
application.css apply.css articles.css common.css
company.css creators.css home.css portfolio.css scaffolds.css
external/*.css home/*.css navigation/*.css
 *.js )