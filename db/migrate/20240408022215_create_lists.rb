class CreateLists < ActiveRecord::Migration[7.1]
  def change
    create_table :lists do |t|
      t.string :name
      t.text :description
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
