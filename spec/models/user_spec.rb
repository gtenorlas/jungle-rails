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

    it "email attribute presence" do
      user = User.new(email: nil) #invalid
      expect(user).to be_invalid
      expect(user.errors[:email]).to include("can't be blank")
  
      user.email = 'email@test.com' #valid
      user.valid?
      expect(user.errors[:email]).not_to include("can't be blank")
    end

    it "first_name attribute presence" do
      user = User.new(first_name: nil) #invalid
      expect(user).to be_invalid
      expect(user.errors[:first_name]).to include("can't be blank")
  
      user.first_name = 'abc' #valid
      user.valid? 
      expect(user.errors[:first_name]).not_to include("can't be blank")
    end

    it "last_name attribute presence" do
      user = User.new(last_name: nil) #invalid
      expect(user).to be_invalid
      expect(user.errors[:last_name]).to include("can't be blank")
  
      user.last_name = 'd' #valid
      user.valid? 
      expect(user.errors[:last_name]).not_to include("can't be blank")
    end

    it "password attribute presence" do
      user = User.new(password: nil) #invalid
      expect(user).to be_invalid
      expect(user.errors[:password]).to include("can't be blank")
  
      user.password = '12345678' #valid
      user.valid? 
      expect(user.errors[:password]).not_to include("can't be blank")
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end
end
