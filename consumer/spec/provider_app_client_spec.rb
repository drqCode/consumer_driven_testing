require 'spec_helper'

require_relative '../provider_app_client'

RSpec.describe ProviderAppClient, pact: true do
  subject { ProviderAppClient.new("http://localhost:1234") }

  describe 'user' do
    before do
      provider_app.given("an alligator exists").
          upon_receiving("a request for an alligator").
          with(method: :get, path: '/user', query: '').
          will_respond_with(
              status: 200,
              headers: {'Content-Type' => 'application/json'},
              body: { user: { name: 'Agile', joined_at: Time.now, age: 10 } } )
    end

    it 'works' do
      expect(subject.get_user.to_s).to include "Name: Agile"
      expect(subject.get_user.to_s).to include "Age: 10 years old"
    end
  end
end