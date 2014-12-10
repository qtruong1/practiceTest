require 'rspec/expectations'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'timeout'

# using the Selenium driver as default so we can popopen Firefox 
# and get a good warm fuzzy feeling

Capybara.default_driver = :selenium