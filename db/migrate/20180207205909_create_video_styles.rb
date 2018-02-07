class CreateVideoStyles < ActiveRecord::Migration[5.1]
  def change
    create_table :video_styles do |t|
      t.string :name
      t.string :video_comments_count
      t.string :video_likes_count
      t.string :video_shares_count
      t.string :video_url
      t.string :thumbnail

      t.timestamps
    end
  end
end
