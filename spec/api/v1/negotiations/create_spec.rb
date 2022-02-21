require 'rails_helper'

RSpec.describe "negotiations#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/negotiations", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'negotiations',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(NegotiationResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Negotiation.count }.by(1)
    end
  end
end
