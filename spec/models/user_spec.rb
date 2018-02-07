require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "is valid with valid attributes" do
      user = User.new(
        name: "Name Test",
        email: "emailTest@test.com",
        business_name: "Business Name Test",
        phone_number: "123-456-7890",
        password: "1234"
      )
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      bad_user = User.new(
        name: nil,
        email: "emailTest@test.com",
        business_name: "Business Name Test",
        phone_number: "123-456-7890",
        password: "1234"
      )
      expect(bad_user).to_not be_valid
    end

    it "is invalid without a email" do
      bad_user = User.new(
        name: "Name Test",
        email: nil,
        business_name: "Business Name Test",
        phone_number: "123-456-7890",
        password: "1234"
      )
      expect(bad_user).to_not be_valid
    end

    it "is invalid without a business name" do
      bad_user = User.new(
        name: "Name Test",
        email: "emailTest@test.com",
        business_name: nil,
        phone_number: "123-456-7890",
        password: "1234"
      )
      expect(bad_user).to_not be_valid
    end

    it "is invalid without a phone_number" do
      bad_user = User.new(
        name: "Name Test",
        email: "emailTest@test.com",
        business_name: "Business Name Test",
        phone_number: nil,
        password: "1234"
      )
      expect(bad_user).to_not be_valid
    end

    it "is invalid without a password" do
      bad_user = User.new(
        name: "Name Test",
        email: "emailTest@test.com",
        business_name: "Business Name Test",
        phone_number: "123-456-7890",
        password: nil
      )
    end
  end

  describe "Associations" do
    it "should have many campaigns" do
      assoc = User.reflect_on_association(:campaigns)
      expect(assoc.macro).to eq :has_many
    end
  end
end
