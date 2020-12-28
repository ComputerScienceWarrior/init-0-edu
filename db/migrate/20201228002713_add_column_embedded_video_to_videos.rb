class AddColumnEmbeddedVideoToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :embedded_video, :text
  end
end
