require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(username: 'pink', password: 'password') }

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_presence_of(:session_token) }
  it { should validate_presence_of(:password_digest) }

  describe '::find_by_credentials' do
    it 'should find correct user' do
      test_user = User.find_by_credentials('pink', 'password')
      expect(test_user).to eq(user)
    end

    it 'should reject wrong info' do
      test_user = User.find_by_credentials('mew2king', 'sucks')
      expect(test_user).not_to eq(user)
    end
  end
end
