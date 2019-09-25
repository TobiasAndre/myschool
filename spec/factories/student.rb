# frozen_string_literal: true

FactoryBot.define do
  factory :student do
    name { FFaker::Lorem.word }
    class_room
  end
end
