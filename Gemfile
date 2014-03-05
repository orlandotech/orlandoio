source 'https://rubygems.org'

ruby '2.0.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.3'
gem 'thin'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.1'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.1'

#friendly urls / nested forms / tagging
gem 'friendly_id', '~> 5.0.0'
gem 'nested_form'
gem 'acts-as-taggable-on'
gem 'rails-jquery-tokeninput'
gem 'redcarpet'
gem 'activeadmin', github: 'gregbell/active_admin'

# bootstrap fontawesome!
gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails',
                              :github => 'anjlab/bootstrap-rails'
gem 'font-awesome-rails'


#authentication omnis
gem "devise", '~> 3.2.2'
gem "omniauth"
gem "omniauth-twitter"
gem "omniauth-github"
gem "omniauth-facebook"
gem 'omniauth-meetup'
gem 'omniauth-linkedin'
gem 'omniauth-google-oauth2'

# Image and file upload
gem 'mini_magick'
gem 'paperclip'
gem 'aws-sdk'
gem 'kaminari'

# Application setup
gem 'figaro'

#Debugging
gem 'pry'
gem 'faker'
gem 'awesome_print'
gem 'annotate'
gem "newrelic_rpm"
gem "sentry-raven", :git => "https://github.com/getsentry/raven-ruby.git"


# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-turbolinks'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'sqlite3'
  gem 'better_errors'
  gem 'sextant'
  gem 'binding_of_caller'
  gem 'meta_request'

  # Guard and Livereload gems
  gem 'guard'
  gem 'guard-livereload'
  gem 'guard-zeus'
  gem 'rb-inotify', :require => false
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
