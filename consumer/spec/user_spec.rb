require 'spec_helper'

RSpec.describe "root", type: :request do
  xit 'works' do
    get '/'

    expect(last_response.status).to eq 200
  end
end