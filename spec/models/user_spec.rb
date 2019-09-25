# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when creating a new user' do
    before(:each) do
      @user = create(:user)
    end

    it { expect(@user).to be_valid }
    it { expect(@user).to validate_presence_of(:name) }

    it 'should have the field name filled' do
      expect(@user.name).not_to be_nil
    end

    it { is_expected.to validate_presence_of(:name) }
  end
end
