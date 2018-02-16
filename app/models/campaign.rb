
class Campaign < ApplicationRecord
  belongs_to :user

  validates :current_status,
    :total_cost,
    :exposure_view_count,
    :video_focus_people,
    :video_focus_product,
    :video_duration,
    :selected_video_style,
    presence: true

end
