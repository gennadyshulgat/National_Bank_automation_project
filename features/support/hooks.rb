Before do |scenario|
  puts 'я код который выполнится до начала сценария'

  options = ::Selenium::WebDriver::Chrome::Options.new(
    args: %w[
      --no-sandbox
      --remote-debugging-port=9222
      --disable-dev-shm-usage
      --ignore-certificate-errors
      --disable-popup-blocking
      --disable-translate
    ]
  )

  $driver = ::Selenium::WebDriver.for(:chrome, options: options)
end

After do |scenario|
  puts 'я код который выполнится после завершения сценария'

  $driver.quit
end