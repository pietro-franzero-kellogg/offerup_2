require 'rails_helper'

RSpec.describe "recommendations#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/recommendations/#{recommendation.id}"
  end

  describe 'basic destroy' do
    let!(:recommendation) { create(:recommendation) }

    it 'updates the resource' do
      expect(RecommendationResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Recommendation.count }.by(-1)
      expect { recommendation.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
