class AddTmbdiDtoFilmLibraries < ActiveRecord::Migration[7.1]
  def change
    add_column :film_libraries, :tmdb_id, :integer
  end
end
