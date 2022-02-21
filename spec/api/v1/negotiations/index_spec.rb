require "rails_helper"

RSpec.describe "negotiations#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/negotiations", params: params
  end

  describe "basic fetch" do
    let!(:negotiation1) { create(:negotiation) }
    let!(:negotiation2) { create(:negotiation) }

    it "works" do
      expect(NegotiationResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["negotiations"])
      expect(d.map(&:id)).to match_array([negotiation1.id, negotiation2.id])
    end
  end
end
