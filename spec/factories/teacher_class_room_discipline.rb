# frozen_string_literal: true

FactoryBot.define do
  factory :teacher_class_room_discipline do
    class_room
    discipline
    teacher
  end
end
