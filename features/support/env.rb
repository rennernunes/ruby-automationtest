require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"

Capybara.configure do |config|

        config.default_driver = :selenium_headless
        config.app_host = "http://127.0.0.1:8080"
end
