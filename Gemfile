# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.2.3"

gem "rails", "~> 7.1.3", ">= 7.1.3.2"

gem "sprockets-rails"

gem "puma", ">= 5.0"

gem "importmap-rails"

gem "turbo-rails"

gem "stimulus-rails"

gem "jbuilder"

gem "bootsnap", require: false

gem "sym_differ", git: "https://github.com/enrique-guillen/sym_differ", branch: "main", require: false

gem "tzinfo-data"

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

group :development do
  gem "cucumber", "~> 9.2.0"
  gem "rspec", "~> 3.13.0"
  gem "rspec-rails", "~> 6.1.0"
  gem "rubocop", "~> 1.62.1"
  gem "rubocop-performance", "~> 1.20.2"
  gem "rubocop-rails", "~> 2.24.0"
  gem "rubocop-rspec", "~> 2.22.0"
  gem "simplecov"
  gem "web-console"
end
