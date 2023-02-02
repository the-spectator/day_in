# frozen_string_literal: true

# Cuprite is a modern Capybara driver which uses Chrome CDP API
# instead of Selenium & co.
# See https://github.com/rubycdp/cuprite

require "capybara/cuprite"
require_relative "../system_test_helpers"

Capybara.register_driver(:cuprite) do |app|
  Capybara::Cuprite::Driver.new(
    app,
    window_size: [1200, 800],
    process_timeout: 10,
    inspector: true,
    headless: !ENV["HEADLESS"].in?(%w[n 0 no false])
  )
end

Capybara.javascript_driver = :cuprite

RSpec.configure do |config|
  config.include SystemTestHelpers, type: :system
end
