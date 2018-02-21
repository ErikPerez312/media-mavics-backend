class VideoStyle < ApplicationRecord
  validates :name,
    :video_url,
    # :video_likes_count,
    # :video_comments_count,
    # :video_shares_count,
    :thumbnail_url,
    :business_name,
    :video_style,
    presence: true
end
