require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "is valid" do
      user = User.new(
        first_name: 'abc',
        last_name: 'd',
        email: 'email@test.com',
        password: '12345678',
        password_confirmation: '12345678'
      )
      expect(user).to be_valid
    end

    
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end
end
