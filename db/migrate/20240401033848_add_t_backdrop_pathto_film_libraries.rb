class AddTBackdropPathtoFilmLibraries < ActiveRecord::Migration[7.1]
  def change
    add_column :film_libraries, :backdrop_url, :string
  end
end
