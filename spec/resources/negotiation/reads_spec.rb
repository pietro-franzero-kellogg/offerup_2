require "rails_helper"

RSpec.describe NegotiationResource, type: :resource do
  describe "serialization" do
    let!(:negotiation) { create(:negotiation) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(negotiation.id)
      expect(data.jsonapi_type).to eq("negotiations")
    end
  end

  describe "filtering" do
    let!(:negotiation1) { create(:negotiation) }
    let!(:negotiation2) { create(:negotiation) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: negotiation2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([negotiation2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:negotiation1) { create(:negotiation) }
      let!(:negotiation2) { create(:negotiation) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      negotiation1.id,
                                      negotiation2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      negotiation2.id,
                                      negotiation1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
