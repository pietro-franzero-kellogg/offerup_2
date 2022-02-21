require 'rails_helper'

RSpec.describe "recommendations#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/recommendations/#{recommendation.id}", payload
  end

  describe 'basic update' do
    let!(:recommendation) { create(:recommendation) }

    let(:payload) do
      {
        data: {
          id: recommendation.id.to_s,
          type: 'recommendations',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(RecommendationResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { recommendation.reload.attributes }
    end
  end
end
