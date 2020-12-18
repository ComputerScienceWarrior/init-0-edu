class AddIsAdminToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :is_admin, :boolean, default: false
  end
end
