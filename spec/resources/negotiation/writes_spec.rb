require 'rails_helper'

RSpec.describe NegotiationResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'negotiations',
          attributes: { }
        }
      }
    end

    let(:instance) do
      NegotiationResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Negotiation.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:negotiation) { create(:negotiation) }

    let(:payload) do
      {
        data: {
          id: negotiation.id.to_s,
          type: 'negotiations',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      NegotiationResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { negotiation.reload.updated_at }
      # .and change { negotiation.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:negotiation) { create(:negotiation) }

    let(:instance) do
      NegotiationResource.find(id: negotiation.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Negotiation.count }.by(-1)
    end
  end
end