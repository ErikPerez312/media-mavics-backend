class AddVideoStyleToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :selected_video_style, :string
  end
end
