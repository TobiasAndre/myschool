# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Discipline, type: :model do
  context 'validations' do
    subject { FactoryBot.create(:discipline) }
    it { is_expected.to validate_presence_of(:name) }
  end

  it 'is valid with name' do
    discipline = build(:discipline)
    expect(discipline).to be_valid
  end

  it { is_expected.to validate_presence_of(:name) }

  it 'returns the correct subject name' do
    discipline_name = FFaker::Lorem.word
    discipline = create(:discipline, name: discipline_name)
    expect(discipline.name).to eq(discipline_name)
  end
end
