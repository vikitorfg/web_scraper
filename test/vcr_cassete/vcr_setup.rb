require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "test/cassettes"
  config.hook_into(:faraday)
  config.allow_http_connections_when_no_cassette = true
end