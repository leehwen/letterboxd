class CreateFilms < ActiveRecord::Migration[7.1]
  def change
    create_table :films do |t|
      t.boolean :like, default: false
      t.boolean :watched, default: false
      t.boolean :watchlist, default: false
      t.integer :rating
      t.references :user, null: false, foreign_key: true
      t.references :film_library, null: false, foreign_key: true
      t.timestamps
    end
  end
end
