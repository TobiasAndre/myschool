# frozen_string_literal: true

FactoryBot.define do
  factory :class_room do
    name { FFaker::Lorem.word }
  end
end
