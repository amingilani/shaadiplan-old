source 'https://rubygems.org'

ruby '2.3.1'
gem 'bundler', '~> 1.13.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'
# Authentication via auth0
gem 'auth0'
gem 'omniauth', '~> 1.3.1'
gem 'omniauth-auth0', '~> 1.4.1'
# Intercom
gem 'intercom-rails'
# Semantic UI
gem 'semantic-ui-sass', github: 'doabit/semantic-ui-sass'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Load .env variables
  gem 'dotenv-rails', require: 'dotenv/rails-now' # rspec for testing
  # Style guide to make developer lives hell
  gem 'rubocop', require: false
  # guard is nice, with all the extras
  gem 'guard'
  gem 'guard-rails', require: false
  gem 'guard-livereload'
  gem 'guard-rubocop'
  gem 'yard', require: false
  # Markdown parsing
  gem 'kramdown'
  # rspec for testing
  gem 'rspec-rails'
  # blackbox testing by faking user interaction
  gem 'capybara', require: false
  # poltergeist is a capybara driver to interface with phantomjs
  gem 'poltergeist', require: false
  # factories make for better testing models
  gem 'factory_girl_rails', require: false
  # automtically generated fake data
  gem 'faker', require: false
  # code coverage
  gem 'simplecov', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Use Capistrano for deployment
  gem 'capistrano-rails'
  # annotations are useful
  gem 'annotate'
  # nested scaffolds
  gem 'nested_scaffold'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
