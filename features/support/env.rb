# encoding: utf-8
require File.dirname(__FILE__)+'/lib/browsercontrol.rb'
require File.dirname(__FILE__)+'/lib/configuration.rb'

require 'capybara'
require 'capybara/dsl'
require 'capybara-webkit'
require 'selenium-webdriver'
require 'cucumber'

module Helpers

#Which URL, driver(capy,webkit, selenium) should hit defined here
    BASE_URL = Configuration['capybara_base_url']
    CAPY_DEFAULT_DRIVER = BrowserControl['capybara_default_driver'].to_sym
    CAPY_JAVASCRIPT_DRIVER = BrowserControl['capybara_javascript_driver'].to_sym


# https comes with an error of "ssl handshake fails" with webkit. To get around the error following lines added
    # Capybara.register_driver :webkit_ignore_ssl do |app|
    #     browser = Capybara::Webkit::Browser.new(Capybara::Webkit::Connection.new).tap do |browser|
    #     browser.ignore_ssl_errors
    # end
    # Capybara::Webkit::Driver.new(app, :browser => browser)
    # end

#headless
Capybara.register_driver :webkit do |app|
    Capybara::Webkit::Driver.new(app, :browser => :webkit)
end


# To use chrome
Capybara.register_driver :selenium_chrome do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
end


# To use safari
Capybara.register_driver :selenium_safari do |app|
    Capybara::Selenium::Driver.new(app, :browser => :safari)
end

# AJAX request needed to resync so selenium waits for the UI update of the browser.
    def without_resynchronize
        page.driver.options[:resynchronize] = false
    yield
        page.driver.options[:resynchronize] = true
    end

# Defining 
#Selenium::WebDriver::Firefox::Binary.path = "~/Applications/Firefox"
    # dddd = Selenium::WebDriver.for :firefox, marionette: true
    # Capybara.app_host = 'http://google.com'
    # Capybara.default_driver = dddd
    #Capybara.javascript_driver = dddd
    Capybara.app_host = BASE_URL
    Capybara.default_driver = CAPY_DEFAULT_DRIVER
    Capybara.javascript_driver = CAPY_JAVASCRIPT_DRIVER
    Capybara.run_server = :false
    Capybara.default_selector = :css

end

World(Capybara::DSL, Helpers)
