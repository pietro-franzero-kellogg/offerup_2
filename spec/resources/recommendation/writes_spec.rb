require 'rails_helper'

RSpec.describe RecommendationResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'recommendations',
          attributes: { }
        }
      }
    end

    let(:instance) do
      RecommendationResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Recommendation.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:recommendation) { create(:recommendation) }

    let(:payload) do
      {
        data: {
          id: recommendation.id.to_s,
          type: 'recommendations',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      RecommendationResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { recommendation.reload.updated_at }
      # .and change { recommendation.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:recommendation) { create(:recommendation) }

    let(:instance) do
      RecommendationResource.find(id: recommendation.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Recommendation.count }.by(-1)
    end
  end
end
