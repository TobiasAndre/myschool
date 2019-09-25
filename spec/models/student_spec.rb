# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Student, type: :model do
  context 'when creating a new student' do
    before(:each) do
      @student = create(:student)
    end

    it { expect(@student).to be_valid }
    it { expect(@student).to validate_presence_of(:name) }

    it 'should have the field name filled' do
      expect(@student.name).not_to be_nil
    end

    it { is_expected.to validate_presence_of(:name) }
  end
end
