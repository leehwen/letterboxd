class ChangeNullForUsername < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :username, :string, null: true
  end
end
