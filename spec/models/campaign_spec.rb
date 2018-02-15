require 'rails_helper'
# Test if input for optional succeeds
# factory bot for testing

RSpec.describe Campaign, type: :model do
  subject {
    User.new(
      name: "rspec Namee",
      email: "rspecEmail@test.com",
      business_name: "rspec User business name",
      phone_number: "999-999-9999"
    )
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      campaign = Campaign.new(
        current_status: "pending",
        total_cost: "550",
        exposure_view_count: "3000",
        video_focus_people: "50",
        video_focus_product: "50",
        video_duration: "60",
        selected_video_style: "product",
        user: subject
      )
      expect(campaign).to be_valid
    end

    it "is invalid without current_status" do
      bad_campaign = Campaign.new(
        current_status: nil,
        total_cost: "550",
        exposure_view_count: "3000",
        video_focus_people: "50",
        video_focus_product: "50",
        video_duration: "60",
        selected_video_style: "product",
        user: subject
      )
      expect(bad_campaign).to_not be_valid
    end

    it "is invalid without total_cost" do
      bad_campaign = Campaign.new(
        current_status: "pending",
        total_cost: nil,
        exposure_view_count: "3000",
        video_focus_people: "50",
        video_focus_product: "50",
        video_duration: "60",
        selected_video_style: "product",
        user: subject
      )
      expect(bad_campaign).to_not be_valid
    end

    it "is invalid without exposure_view_count" do
      bad_campaign = Campaign.new(
        current_status: "pending",
        total_cost: "550",
        exposure_view_count: nil,
        video_focus_people: "50",
        video_focus_product: "50",
        video_duration: "60",
        selected_video_style: "product",
        user: subject
      )
      expect(bad_campaign).to_not be_valid
    end

    it "is invalid without video_focus_people" do
      bad_campaign = Campaign.new(
        current_status: "pending",
        total_cost: "550",
        exposure_view_count: "3000",
        video_focus_people: nil,
        video_focus_product: "50",
        video_duration: "60",
        selected_video_style: "product",
        user: subject
      )
      expect(bad_campaign).to_not be_valid
    end

    it "is invalid without video_focus_product" do
      bad_campaign = Campaign.new(
        current_status: "pending",
        total_cost: "550",
        exposure_view_count: "3000",
        video_focus_people: "50",
        video_focus_product: nil,
        video_duration: "60",
        selected_video_style: "product",
        user: subject
      )
      expect(bad_campaign).to_not be_valid
    end

    it "is invalid without video_duration" do
      bad_campaign = Campaign.new(
        current_status: "pending",
        total_cost: "550",
        exposure_view_count: "3000",
        video_focus_people: "50",
        video_focus_product: "50",
        video_duration: nil,
        selected_video_style: "product",
        user: subject
      )
      expect(bad_campaign).to_not be_valid
    end

    it "is invalid without selected_video_style" do
      bad_campaign = Campaign.new(
        current_status: "pending",
        total_cost: "550",
        exposure_view_count: "3000",
        video_focus_people: "50",
        video_focus_product: "50",
        video_duration: "30",
        selected_video_style: nil,
        user: subject
      )
      expect(bad_campaign).to_not be_valid
    end

    it "is invalid without a user" do
      bad_campaign = Campaign.new(
        current_status: "pending",
        total_cost: "550",
        exposure_view_count: "3000",
        video_focus_people: "50",
        video_focus_product: "50",
        video_duration: "50",
        user: nil
      )
      expect(bad_campaign).to_not be_valid
    end
  end
end
