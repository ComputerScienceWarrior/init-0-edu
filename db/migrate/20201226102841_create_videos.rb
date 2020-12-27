class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :caption
      t.integer :topic_id

      t.timestamps
    end
  end
end
