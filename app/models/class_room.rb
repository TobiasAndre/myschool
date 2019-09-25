# frozen_string_literal: true

class ClassRoom < ApplicationRecord
  has_many :students, dependent: :destroy
  has_many :teacher_class_room_disciplines, dependent: :destroy
  has_many :teachers, through: :teacher_class_room_disciplines, dependent: :destroy
  has_many :disciplines, through: :teacher_class_room_disciplines, dependent: :destroy

  accepts_nested_attributes_for :teacher_class_room_disciplines

  validates :name, presence: true
end
