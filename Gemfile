source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'devise'
gem 'activeadmin'
gem 'rack-cors'
gem 'knock', '~> 2.1', '>= 2.1.1'
gem 'bcrypt', '~> 3.1.7'
gem 'active_model_serializers', '~> 0.10.7'
gem 'jbuilder', '~> 2.5'
gem 'jwt'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'annotate', '~> 2.7', '>= 2.7.4' # annotate models
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring' # speeds up development by keeping your application running in the background
  gem 'spring-watcher-listen', '~> 2.0.0' # make spring use listen
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
