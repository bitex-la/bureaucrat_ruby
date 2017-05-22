require "bureaucrat_ruby/version"
require 'json'
require 'json_api_client'
require 'json_ffi_client'

module BureaucratRuby
  class Base < JsonApiClient::Resource
    self.connection_class = JsonFfiClient::Connection
      .configured_for(:bureaucrat, __dir__)
  end

  class Cbu < Base; end
  
  class Cuit < Base; end
end
