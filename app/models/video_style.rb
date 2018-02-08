class VideoStyle < ApplicationRecord
  validates :name,
    :video_url,
    :video_likes_count,
    :video_comments_count,
    :video_shares_count,
    :thumbnail_url,
    presence: true
end
