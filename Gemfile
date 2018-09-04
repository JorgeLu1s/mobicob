source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'active_model_serializers', '~> 0.10.7' # generate JSON manner
gem 'activeadmin', '~> 1.3' # administration framework
gem 'arctic_admin', '~> 1.5' # responsive theme for Active Admin
gem 'bcrypt', '~> 3.1.7' # hashing passwords
gem 'bootsnap', '>= 1.1.0', require: false # Reduces boot times through caching
gem 'devise', '~> 4.4', '>= 4.4.3' # authentication
gem 'devise-i18n', '~> 1.6', '>= 1.6.4' # Translations for the devise gem
gem 'font-awesome-sass', '~> 5.2.0'
gem 'jbuilder', '~> 2.5' # Create JSON structures via a Builder-style DSL
gem 'jwt' # JSON Web Token
gem 'kaminari-i18n', '~> 0.3.2' # Translations for the kaminari gem
gem 'knock', '~> 2.1', '>= 2.1.1' # Authentication based on JWT
gem 'pg', '>= 0.18', '< 2.0' # Ruby interface for PostgreSQL
gem 'puma', '~> 3.11' # HTTP 1.1 server
gem 'rack-cors', '~> 1.0', '>= 1.0.2' # CORS compatibility
gem 'rails', '~> 5.2.0' # full-stack web framework

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
