require 'spec_helper'

RSpec.describe "/user", type: :request do
  it 'works' do
    get '/user'

    expect(last_response.status).to eq 200
  end
end