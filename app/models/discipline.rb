# frozen_string_literal: true

class Discipline < ApplicationRecord
  has_many :teacher_class_room_disciplines, dependent: :destroy
  has_many :teachers, through: :teacher_class_room_disciplines, dependent: :destroy

  validates :name, presence: true
end
