class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :firstname
      t.string :lastname
      t.string :username
      t.integer :room_no

      t.timestamps
    end
  end
end
