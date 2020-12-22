class RemoveFirstnameFromStudents < ActiveRecord::Migration[6.0]
  def change
    remove_column :students, :firstname, :string
  end
end
