# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'bootsnap', require: false
gem 'chartkick'
gem 'cssbundling-rails'
gem 'devise', '~> 4.8'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4'
gem 'redis', '~> 4.0'
gem 'simple_form'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'wicked_pdf'

group :development, :test do
  gem 'byebug'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop', require: false
  gem 'wkhtmltopdf-binary'
end

gem 'wkhtmltopdf-heroku', '2.12.6.1.pre.jammy', group: :production

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
