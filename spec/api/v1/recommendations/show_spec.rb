require "rails_helper"

RSpec.describe "recommendations#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/recommendations/#{recommendation.id}", params: params
  end

  describe "basic fetch" do
    let!(:recommendation) { create(:recommendation) }

    it "works" do
      expect(RecommendationResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("recommendations")
      expect(d.id).to eq(recommendation.id)
    end
  end
end
