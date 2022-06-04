# frozen_string_literal: true

module SystemTestHelpers
  def expect_no_js_errors
    last_timestamp = page.driver.browser.logger.logs
      .map(&:timestamp)
      .last || 0

    yield

    errors = page.driver.browser.logger.logs

    errors = errors.reject { |e| e.timestamp.blank? || e.timestamp < last_timestamp } if last_timestamp > 0
    errors = errors.filter { |e| e.level == "error" }

    expect(errors.length).to be_zero, "Expected no js errors, but these errors where found: #{errors.map(&:message).join(", ")}"
  end

  def resize_for(display_details)
    page.driver.resize(*calculate_resolution(display_details))
  end

  def wait_for_ajax
    page.driver.wait_for_network_idle
  end

  def pause
    page.driver.pause
  end

  def debug(binding = nil)
    $stdout.puts "🔎 Open Chrome inspector at http://localhost:3333"
    return binding.break if binding
    page.driver.pause
  end
end
