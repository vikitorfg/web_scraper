source "https://rubygems.org"

# out of the box
ruby "3.2.2"
gem "rails", "~> 7.1.1"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", ">= 4.0.1"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

# Custom
# Webscraping
gem 'nokogiri', '~> 1.15', '>= 1.15.4'
gem 'faraday', '~> 2.7', '>= 2.7.11'
gem 'sidekiq', '~> 7.0', '>= 7.0.9'

# CSS
gem 'bulma-rails', '~> 0.9.4'

# Pagination
gem 'pagy', '~> 6.1'

# Authentication
gem 'devise', '~> 4.9', '>= 4.9.3'
gem 'pundit', '~> 2.3', '>= 2.3.1'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem 'vcr', '~> 6.2'
end
