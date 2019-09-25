# frozen_string_literal: true

class TeacherClassRoomDiscipline < ApplicationRecord
  belongs_to :teacher
  belongs_to :class_room
  belongs_to :discipline
end
