require 'rubygems'
require 'bundler/setup'
require 'webmock/rspec'

require 'calagator'

RSpec.configure do |c|
  c.include(WebMock::API)
end
