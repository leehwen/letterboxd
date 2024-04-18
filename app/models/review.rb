class Review < ApplicationRecord
  belongs_to :film
  belongs_to :user
  belongs_to :film_library

  validates :date, :review, :rating, presence: true
  validates :rating, comparison: { other_than: 0 }
  validates :review, uniqueness: { scope: :film_id, message: "You posted a similar review previously"}
end
