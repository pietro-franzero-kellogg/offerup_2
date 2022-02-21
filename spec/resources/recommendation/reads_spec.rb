require "rails_helper"

RSpec.describe RecommendationResource, type: :resource do
  describe "serialization" do
    let!(:recommendation) { create(:recommendation) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(recommendation.id)
      expect(data.jsonapi_type).to eq("recommendations")
    end
  end

  describe "filtering" do
    let!(:recommendation1) { create(:recommendation) }
    let!(:recommendation2) { create(:recommendation) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: recommendation2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([recommendation2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:recommendation1) { create(:recommendation) }
      let!(:recommendation2) { create(:recommendation) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      recommendation1.id,
                                      recommendation2.id,
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
                                      recommendation2.id,
                                      recommendation1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
