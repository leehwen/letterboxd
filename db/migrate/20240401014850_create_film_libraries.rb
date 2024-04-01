class CreateFilmLibraries < ActiveRecord::Migration[7.1]
  def change
    create_table :film_libraries do |t|
      t.string :title
      t.text :description
      t.string :director
      t.string :genres, array: true, default: []
      t.integer :runtime
      t.string :release_date
      t.string :image_url
      t.timestamps
    end
  end
end
