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

    it "password and password_confirmation does not match" do
      user = User.new(
        first_name: 'abc',
        last_name: 'd',
        email: 'email@test.com',
        password: '12345678',
        password_confirmation: '12345679'
      )
    
      user.valid?
      expect(user.errors[:password_confirmation]).to be_present
    end

    it 'email should be unique' do
      user1 = User.new(
        first_name: 'abc',
        last_name: 'd',
        email: 'email@test.com',
        password: '12345678',
        password_confirmation: '12345678'
      )
      user1.save
    
      user2 = User.new(
        first_name: 'abc',
        last_name: 'd',
        email: 'EMAIL@test.com',
        password: '12345678',
        password_confirmation: '12345678'
      )
      user2.save
    
      expect(user2.errors[:email].first).to eq('has already been taken')
    end

    it 'password should be at least 8 characters long' do
      user = User.new(
        password: '12345678',
        password_confirmation: '12345678'
      )
      user.valid? 
      expect(user.errors[:password]).not_to include("Password must be at least 8 characters")

      user = User.new(
        password: '1234567',
        password_confirmation: '1234567'
      )
      user.valid? 
      expect(user.errors[:password]).to include("Password must be at least 8 characters")
    
    end
  end

  describe '.authenticate_with_credentials' do

    it 'should pass with valid email and password' do
      user = User.new(
        first_name: 'abc',
        last_name: 'd',
        email: 'email@test.com',
        password: '12345678',
        password_confirmation: '12345678'
      )
      user.save

      user = User.authenticate_with_credentials('email@test.com', '12345678')
      expect(user).not_to be(nil)
    end

    it 'should not pass with invalid password' do
      user = User.new(
        first_name: 'abc',
        last_name: 'd',
        email: 'email@test.com',
        password: '12345678',
        password_confirmation: '12345678'
      )
      user.save

      user = User.authenticate_with_credentials('email@test.com', '1234567')
      expect(user).to be(nil)
    end

    it 'should not pass with invalid email' do
      user = User.new(
        first_name: 'abc',
        last_name: 'd',
        email: 'email@test.com',
        password: '12345678',
        password_confirmation: '12345678'
      )
      user.save

      user = User.authenticate_with_credentials('mail@test.com', '12345678')
      expect(user).to be(nil)
    end

    it 'should pass with valid email with spaces before and after' do
      user = User.new(
        first_name: 'abc',
        last_name: 'd',
        email: 'email@test.com',
        password: '12345678',
        password_confirmation: '12345678'
      )
      user.save

      user = User.authenticate_with_credentials(' email@test.com ', '12345678')
      expect(user).not_to be(nil)
    end

  end
end
