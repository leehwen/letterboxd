class CreateFilmLists < ActiveRecord::Migration[7.1]
  def change
    create_table :film_lists do |t|
      t.text :notes
      t.references :film, foreign_key: true, null: false
      t.references :list, foreign_key: true, null: false
      t.timestamps
    end
  end
end
