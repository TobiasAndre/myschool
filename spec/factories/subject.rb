# frozen_string_literal: true

FactoryBot.define do
  factory :subject do
    name { FFaker::Lorem.word }
  end
end
