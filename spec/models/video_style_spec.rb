require 'rails_helper'

RSpec.describe VideoStyle, type: :model do
  describe "Validations" do
    it "is valid with valid attributes" do
      style = VideoStyle.new(
        name: "Test style",
        video_url: "www.testurlsss.com",
        thumbnail_url: "www.thumbnail_urltest.com",
        business_name: "teset name",
        video_style: "test style"

      )
      expect(style).to be_valid
    end

    it "is invalid without a name" do
      bad_style = VideoStyle.new(
        name: nil,
        video_url: "www.testurlsss.com",
        thumbnail_url: "www.thumbnail_urltest.com",
        business_name: "teset name",
        video_style: "test style"
      )
      expect(bad_style).to_not be_valid
    end

    it "is invalid without a video_url" do
      bad_style = VideoStyle.new(
        name: "Test style""Test style",
        video_url: nil,
        thumbnail_url: "www.thumbnail_urltest.com",
        business_name: "teset name",
        video_style: "test style"
      )
      expect(bad_style).to_not be_valid
    end

    it "is invalid witout a thumbnail_url" do
      bad_style = VideoStyle.new(
        name: "Test style",
        video_url: "www.testurlsss.com",
        thumbnail_url: nil,
        business_name: "teset name",
        video_style: "test style"
      )
      expect(bad_style).to_not be_valid
    end

    it "is invalid witout a business_name" do
      bad_style = VideoStyle.new(
        name: "Test style",
        video_url: "www.testurlsss.com",
        thumbnail_url: "thumbnail",
        business_name: nil,
        video_style: "test style"
      )
      expect(bad_style).to_not be_valid
    end

    it "is invalid witout a video_style" do
      bad_style = VideoStyle.new(
        name: "Test style",
        video_url: "www.testurlsss.com",
        thumbnail_url: "testttt",
        business_name: "teset name",
        video_style: nil
      )
      expect(bad_style).to_not be_valid
    end
  end
end
