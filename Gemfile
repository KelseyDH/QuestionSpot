source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

gem 'quiet_assets'

gem 'haml'

gem 'html2haml'

gem 'devise'
gem 'omniauth-twitter'
gem 'twitter'

# Use jquery as the JavaScript library
# Note order placement of jquery must follow this:
gem 'jquery-rails'

gem 'jquery-ui-rails'

# gem 'factory_girl_rails'

gem 'thin'

#if you're using MongoDB you need a different gem
gem 'delayed_job_active_record'
gem 'delayed_job_web'

#controls administrator rights
gem 'activeadmin', github: 'gregbell/active_admin'
#gem 'paginate'
gem 'kaminari'

gem 'cancan'

#shows percentage of test coverage
gem 'simplecov', require: false, group: :test

gem 'simple_form', git: "https://github.com/plataformatec/simple_form"

#good for 1 or 2 file uploads
gem "paperclip", "~> 4.1"
gem "aws-sdk", '~> 1.5.7' #sets up paperclip in AWS

#more robust and popular gem for many uploads
# gem "carrierwave"
gem "rmagick", require: "RMagick" #helps resizing 
# gem "fog"  #gem for cloud hosting configuration

group :development, :test do
  gem 'rspec-rails'
  gem 'faker'
  gem "factory_girl_rails"
  gem "capybara"
  # gem "capybara-webkit"
  gem 'selenium-webdriver', '~> 2.41.0'
  gem "database_cleaner"
  gem "rails-erd" #use rake erd to create a .dot file you can view current ERD with graphviz
end
# # DEPRECRATED Use sqlite3 as the database for Active Record
# gem 'sqlite3'

# Use Post Gres as the database for Active Record
gem 'pg'

group :development do
  gem "hirb"
  gem "interactive_editor"
  gem "awesome_print"
  # gem 'better_errors' #debugging gem
  # gem 'binding_of_caller' #debugging gem
  gem "letter_opener"

end

gem "bootstrap-sass", '~> 3.1.1'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# # Use CoffeeScript for .js.coffee assets and views
# gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
