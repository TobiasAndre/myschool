# frozen_string_literal: true

class Teacher < ApplicationRecord
  has_many :teacher_class_room_disciplines, dependent: :destroy
  has_many :class_rooms, through: :teacher_class_room_disciplines

  validates :name, presence: true
end
