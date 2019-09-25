# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TeacherClassRoomDiscipline, type: :model do
  context 'valid Factory' do
    it 'has a valid factory' do
      expect(FactoryBot.create(:teacher_class_room_discipline)).to be_valid
    end
  end
end
