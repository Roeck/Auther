source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'

gem 'sass-rails', '>= 6'
gem 'bootstrap', '~> 5.0', '>= 5.0.1'

gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise', github: "heartcombo/devise", branch: "master"
gem 'figaro'

gem 'omniauth-google-oauth2', '~> 1.0'
gem 'omniauth-rails_csrf_protection'

gem 'omniauth-github'

gem 'omniauth-twitter', '~> 1.4'

# gem 'omniauth-facebook'

gem 'devise_invitable', '~> 2.0', '>= 2.0.5'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
