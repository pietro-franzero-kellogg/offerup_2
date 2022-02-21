require 'rails_helper'

RSpec.describe "negotiations#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/negotiations/#{negotiation.id}"
  end

  describe 'basic destroy' do
    let!(:negotiation) { create(:negotiation) }

    it 'updates the resource' do
      expect(NegotiationResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Negotiation.count }.by(-1)
      expect { negotiation.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
