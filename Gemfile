source 'https://rubygems.org'

gem 'coffee-rails', '4.1.0'
gem 'gon', '6.0.1'
gem 'holiday_jp', '0.4.3'

group :development do
  gem 'uglifier', '2.7.2'
  gem 'compass'
  gem 'guard'
  gem 'guard-sass'
  gem 'guard-sprockets'
  gem 'guard-shell'
end

group :test do
  gem 'coveralls', require: false
  gem 'minitest-rails-capybara'
  gem 'minitest-reporters', '1.0.18'
  gem 'minitest-ar-assertions', "0.1.1", :require => 'minitest_activerecord_assertions'
  gem "minitest-power_assert", "0.2.0"    
end

group :test, :development do
  gem 'poltergeist'
end
