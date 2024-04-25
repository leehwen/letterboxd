class AddColumnsToFilms < ActiveRecord::Migration[7.1]
  def change
    add_column :films, :like_updated_at, :datetime
    add_column :films, :watched_updated_at, :datetime
    add_column :films, :watchlist_updated_at, :datetime
    add_column :films, :rating_updated_at, :datetime
  end
end
