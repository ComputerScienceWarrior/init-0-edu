class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.datetime :edited_at
      t.integer :student_id
      t.integer :course_id

      t.timestamps
    end
  end
end
