class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.string :duration
      t.integer :rating

      t.timestamps
    end
  end
end
