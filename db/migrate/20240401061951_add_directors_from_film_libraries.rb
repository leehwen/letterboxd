class AddDirectorsFromFilmLibraries < ActiveRecord::Migration[7.1]
  def change
    add_column :film_libraries, :directed_by, :string, array: true, default: []
  end
end
