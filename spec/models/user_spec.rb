require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    it 'Should not save a user if password and confirmation do not match' do
      user = User.create(first_name: 'Jane', last_name: 'Doe', email: 'JaneDoe@test.com', password: 'testerpass', password_confirmation: 'notthesame')
      puts user.errors.full_messages
      expect(user).not_to be_valid
    end

    it 'Should be valid if user saves valid data with matching passwords' do
      user = User.create(first_name: 'Jane', last_name: 'Doe', email: 'JaneDoe@test.com', password: 'testerpass', password_confirmation: 'testerpass')
      expect(user).to be_valid
    end

    it 'Should be valid if user creates a password less than minimum length' do
      user = User.create(first_name: 'Jane', last_name: 'Doe', email: 'JaneDoe@test.com', password: 'ok', password_confirmation: 'ok')
      puts user.errors.full_messages
      expect(user).not_to be_valid
    end

    it 'Should be invalid if a user creates an account with the same email' do
      user1 = User.create(first_name: 'Jane', last_name: 'Doe', email: 'JaneDoe@test.com', password: 'testerpass', password_confirmation: 'testerpass')
      user2 = User.create(first_name: 'John', last_name: 'Doe', email: 'JaneDoe@test.com', password: 'testerpass', password_confirmation: 'testerpass')
      puts user2.errors.full_messages
      expect(user2).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'Should return the user if the user exists and password is correct' do
      User.create(first_name: 'Jane', last_name: 'Doe', email: 'JaneDoe@test.com', password: 'testerpass', password_confirmation: 'testerpass')
      expect(authenticate_with_credentials('JaneDoe@test.com', 'testerpass')).not_to be nil
    end

    it "Should return nil if the user doesn't exist" do
      expect(authenticate_with_credentials('JohnDoe@test.com', 'testerpass')).to be nil
    end

    it 'Should return nil if the password does not match email' do
      User.create(first_name: 'Jane', last_name: 'Doe', email: 'JaneDoe@test.com', password: 'testerpass', password_confirmation: 'testerpass')
      expect(authenticate_with_credentials('JaneDoe@test.com', 'wrongpass')).to be nil
    end

    it 'Should return the user if the user enters whitespace between their email entry' do
      User.create(first_name: 'Jane', last_name: 'Doe', email: 'JaneDoe@test.com', password: 'testerpass', password_confirmation: 'testerpass')
      expect(authenticate_with_credentials('  JaneDoe@test.com ', 'testerpass')).not_to be nil
    end

    it 'Should return the user if the user enters their email with incorrect casing' do
      User.create(first_name: 'Jane', last_name: 'Doe', email: 'JaneDoe@test.com', password: 'testerpass', password_confirmation: 'testerpass')
      expect(authenticate_with_credentials('jaNeDOE@test.com', 'testerpass')).not_to be nil
    end
  end
end
