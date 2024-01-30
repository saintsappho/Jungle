require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations:' do

    it 'Has a password' do
      user = User.new(name: "Bob Doug", email: "bobdoug@test.com", password: "testtest" , password_confirmation: "testtest")
      expect(user).to be_valid
    end

    it 'Confirms password' do
      user = User.new(name: "Bob Doug", email: "bobdoug@test.com", password: "testtest", password_confirmation: "testwrong")
      expect(user).not_to be_valid
    end

    it 'Has a (unique) email' do
      user = User.new(name: "Bob Doug", email: "bobdoug@test.com", password: "testtest" , password_confirmation: "testtest")
      user.save
      
      dupe_user = User.new(name: "Bob Doug", email: "bobdoug@test.com", password: "testtest" , password_confirmation: "testtest")
      expect(dupe_user).not_to be_valid
    end
    
    it 'Has a name' do
      user = User.new(name: "Bob Doug", email: "bobdoug@test.com", password: "testtest" , password_confirmation: "testtest")
      expect(user.name).not_to be_nil
    end

    it 'Has a first and last name' do
      user = User.new(name: "Bob Doug", email: "bobdoug@test.com", password: "testtest" , password_confirmation: "testtest")
      names = user.name.split(" ")
      expect(names.length).to be >=2
    end

  end
  describe '.authenticate_with_credentials:' do
    it 'logs user in with correct password' do
      user = User.create(name: "Bob Doug", email: "bobdoug@test.com", password: "password", password_confirmation: "password")
      authenticated_user = User.authenticate_with_credentials("bobdoug@test.com", "password")
      expect(authenticated_user).to eq(user)
    end
    it 'fails to log user in with incorrect password' do
      user = User.create(name: "Bob Doug", email: "bobdoug@test.com", password: "password", password_confirmation: "password")
      authenticated_user = User.authenticate_with_credentials("bobdoug@test.com", "wrong")
      expect(authenticated_user).to be_nil
    end
    it 'fails to log user in with incorrect email' do
      user = User.create(name: "Bob Doug", email: "bobdoug@test.com", password: "password", password_confirmation: "password")
      authenticated_user = User.authenticate_with_credentials("bobdoug@wrong.com", "password")
      expect(authenticated_user).to be_nil
    end
    it 'logs user in with alternate email case' do
      user = User.create(name: "Bob Doug", email: "bobdoug@test.com", password: "password", password_confirmation: "password")
      authenticated_user = User.authenticate_with_credentials("BoBdOuG@test.com", "password")
      expect(authenticated_user).to eq(user)
    end
    it 'fails to log user in with incorrect password case' do
      user = User.create(name: "Bob Doug", email: "bobdoug@test.com", password: "password", password_confirmation: "password")
      authenticated_user = User.authenticate_with_credentials("BoBdOuG@test.com", "pAsSwOrD")
      expect(authenticated_user).to be_nil
    end
    it 'logs user in with extant email whitespace' do
      user = User.create(name: "Bob Doug", email: "bobdoug@test.com", password: "password", password_confirmation: "password")
      authenticated_user = User.authenticate_with_credentials("  bobdoug@test.com  ", "password")
      expect(authenticated_user).to eq(user)
    end
    it 'fails to log user in with extant password whitespace' do
      user = User.create(name: "Bob Doug", email: "bobdoug@test.com", password: "password", password_confirmation: "password")
      authenticated_user = User.authenticate_with_credentials("bobdoug@test.com", " password  ")
      expect(authenticated_user).to be_nil
    end
  end
end
