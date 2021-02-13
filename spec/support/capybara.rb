require 'capybara/rspec'
require 'webdrivers'

Capybara.register_driver :chrome do |app|
  Selenium::WebDriver.logger.level = :error

  Capybara::Selenium::Driver.new app,
    browser: :chrome,
    options: Selenium::WebDriver::Chrome::Options.new(
      args: %w[no-sandbox disable-dev-shm-usage disable-popup-blocking headless disable-gpu window-size=1920,1080 --enable-features=NetworkService,NetworkServiceInProcess --disable-features=VizDisplayCompositor],
      log_level: :error
    )
end

Capybara.default_driver = :chrome
Capybara.javascript_driver = :chrome

Capybara.default_max_wait_time = 15
Capybara.server = :webrick