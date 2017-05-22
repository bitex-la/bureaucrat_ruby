$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "bureaucrat_ruby"
RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:expect, :should]
  end
end
