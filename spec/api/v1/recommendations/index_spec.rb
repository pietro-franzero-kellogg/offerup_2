require "rails_helper"

RSpec.describe "recommendations#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/recommendations", params: params
  end

  describe "basic fetch" do
    let!(:recommendation1) { create(:recommendation) }
    let!(:recommendation2) { create(:recommendation) }

    it "works" do
      expect(RecommendationResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["recommendations"])
      expect(d.map(&:id)).to match_array([recommendation1.id,
                                          recommendation2.id])
    end
  end
end
