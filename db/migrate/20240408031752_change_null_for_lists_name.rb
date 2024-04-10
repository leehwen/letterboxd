class ChangeNullForListsName < ActiveRecord::Migration[7.1]
  def change
    change_column_null :lists, :name, false
  end
end
