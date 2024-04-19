class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.date "date", null: false
      t.text "review", null: false
      t.integer "rating", default: 0, null: false
      t.references :film, foreign_key: true, null: false
      t.timestamps
    end
  end
end
