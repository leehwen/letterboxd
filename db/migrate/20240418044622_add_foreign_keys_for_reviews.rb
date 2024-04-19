class AddForeignKeysForReviews < ActiveRecord::Migration[7.1]
  def change
    add_reference :reviews, :user, foreign_key: true, null: false
    add_reference :reviews, :film_library, foreign_key: true, null: false
  end
end
