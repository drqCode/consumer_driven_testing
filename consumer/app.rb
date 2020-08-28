require 'json'
require 'net/http'
require_relative 'provider_app_client'

class Application
  def call(_env)
    status = 200
    headers = { "Content-Type" => "text/plain" }
    body = [ProviderAppClient.new.get_user.to_s]

    [status, headers, body]
  end
end