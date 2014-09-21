require "coverme/version"
require "ostruct"
require 'net/http'
require 'uri'

module Coverme
  class << self
    def config
      @config ||= OpenStruct.new
    end

    def ship_it(json)
      raise TokenMissingError if !config.token
      project_token = config.token
      host_uri = config.uri || 'http://coverme.outsmartin.de'
      uri = URI.parse("#{host_uri}/api/add_run")

      body = {
        'run[test]' => json,
        'token' => project_token,
      }

      current_commit = `git rev-parse HEAD`
      if $?.success?
        body['run[commit]'] = current_commit
      end

      Net::HTTP.post_form( uri, body )
    end
  end
end
=begin
require 'simplecov'
require 'simplecov-json'
require 'pry'
SimpleCov.formatter = SimpleCov::Formatter::JSONFormatter
SimpleCov.start
SimpleCov.at_exit do
  result = SimpleCov.result.format!
  Coverme.config.token = 'yourtokenhere'
  Coverme.ship_it(result)
end
=end
