require 'rails_helper'

RSpec.describe Negotiation, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:messages) }

    it { should belong_to(:item) }

    it { should belong_to(:buyer) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
