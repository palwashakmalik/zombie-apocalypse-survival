# frozen_string_literal: true

require 'factory_bot_rails'
require 'simplecov'
SimpleCov.start do
  add_filter 'app/helpers/'
  add_filter 'config/initializers/rails_admin.rb'
  add_filter 'spec/rails_helper.rb'
  add_filter 'app/controllers/application_controller.rb'
  add_filter 'app/policies/application_policy.rb'
  add_group 'Models', 'app/models'
  add_group 'Controllers', 'app/controllers'
end
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
