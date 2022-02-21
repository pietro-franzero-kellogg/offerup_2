require "rails_helper"

RSpec.describe "negotiations#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/negotiations/#{negotiation.id}", payload
  end

  describe "basic update" do
    let!(:negotiation) { create(:negotiation) }

    let(:payload) do
      {
        data: {
          id: negotiation.id.to_s,
          type: "negotiations",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(NegotiationResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { negotiation.reload.attributes }
    end
  end
end
