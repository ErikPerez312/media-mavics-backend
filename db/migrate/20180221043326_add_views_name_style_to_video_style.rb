class AddViewsNameStyleToVideoStyle < ActiveRecord::Migration[5.1]
  def change
    add_column :video_styles, :video_style, :string
    add_column :video_styles, :video_views, :integer, :default => 0
    add_column :video_styles, :business_name, :string
  end
end
