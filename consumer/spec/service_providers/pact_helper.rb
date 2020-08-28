require 'pact/consumer/rspec'

Pact.service_consumer "Consumer App" do
  has_pact_with "Provider App" do
    mock_service :provider_app do
      port 1234
      #host "..."
    end
  end
end