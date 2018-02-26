class AddThumbnailUrlToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :video_thumbnail_url, :string
  end
end
