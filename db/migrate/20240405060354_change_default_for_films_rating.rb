class ChangeDefaultForFilmsRating < ActiveRecord::Migration[7.1]
  def change
    change_column_default :films, :rating, 0
  end
end
