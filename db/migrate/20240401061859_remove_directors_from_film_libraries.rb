class RemoveDirectorsFromFilmLibraries < ActiveRecord::Migration[7.1]
  def change
    remove_column :film_libraries, :director, :string
  end
end
