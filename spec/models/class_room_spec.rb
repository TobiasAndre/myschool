# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ClassRoom, type: :model do
  context 'when creating a new class room' do
    it 'is valid with description' do
      class_room = create(:class_room)
      expect(class_room).to be_valid
    end

    it { is_expected.to validate_presence_of(:name) }
  end
end
