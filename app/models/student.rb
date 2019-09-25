# frozen_string_literal: true

class Student < ApplicationRecord
  belongs_to :class_room

  validates :name, presence: true
end
