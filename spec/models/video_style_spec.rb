require 'rails_helper'

RSpec.describe VideoStyle, type: :model do
  describe "Validations" do
    it "is valid with valid attributes" do
      style = VideoStyle.new(
        name: "Test style",
        video_url: "www.testurlsss.com",
        thumbnail_url: "www.thumbnail_urltest.com"
      )
      expect(style).to be_valid
    end

    it "is invalid without a name" do
      bad_style = VideoStyle.new(
        name: nil,
        video_url: "www.testurlsss.com",
        thumbnail_url: "www.thumbnail_urltest.com"
      )
      expect(bad_style).to_not be_valid
    end

    it "is invalid without a video_url" do
      bad_style = VideoStyle.new(
        name: "Test style""Test style",
        video_url: nil,
        thumbnail_url: "www.thumbnail_urltest.com"
      )
      expect(bad_style).to_not be_valid
    end

    it "is invalid witout a thumbnail_url" do
      bad_style = VideoStyle.new(
        name: "Test style",
        video_url: "www.testurlsss.com",
        thumbnail_url: nil
      )
      expect(bad_style).to_not be_valid
    end
  end
end
