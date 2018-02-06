class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.string :current_status
      t.string :total_cost
      t.string :exposure_view_count
      t.string :video_focus_people
      t.string :video_focus_product
      t.string :video_duration
      t.string :video_title
      t.string :video_link_url
      t.string :video_like_count
      t.string :video_comment_count
      t.string :video_share_count

      t.timestamps
    end
  end
end
