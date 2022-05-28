require "capybara/rails"
require "capybara/rspec"

Capybara.server = :puma
Capybara.app_host = "http://localhost:3001"

# Capybara settings (not covered by Rails system tests)

# Use 0.0.0.0:3002 to make it possible to access
# the test server from the outside world
Capybara.server_host = ENV.fetch("APP_HOST", "0.0.0.0")
Capybara.server_port = 3002

# Don't wait too long in `have_xyz` matchers
Capybara.default_max_wait_time = 2

# Re-raise server errors instead of ignoring them
Capybara.raise_server_errors = true

# Where to store artefacts (e.g. screenshots)
Capybara.save_path = "./tmp/capybara_output"

# Normalizes whitespaces when using `has_text?` and similar matchers
# (the old Capybara behaviour)
Capybara.default_normalize_ws = true

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :cuprite
  end
end
