class AddUidToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :uid, :integer
  end
end
