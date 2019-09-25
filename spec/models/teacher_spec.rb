# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Teacher, type: :model do
  context 'when creating a new teacher' do
    before(:each) do
      @teacher = create(:teacher)
    end

    it { expect(@teacher).to be_valid }
    it { expect(@teacher).to validate_presence_of(:name) }

    it 'should have the field name filled' do
      expect(@teacher.name).not_to be_nil
    end

    it { is_expected.to validate_presence_of(:name) }
  end
end
