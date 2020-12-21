class AddGoogleRefreshTokenToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :google_refresh_token, :string
  end
end
