class AddCastToFilmLibraries < ActiveRecord::Migration[7.1]
  def change
    add_column :film_libraries, :cast, :string, array: true, default: []
  end
end
