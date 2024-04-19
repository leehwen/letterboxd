class Film < ApplicationRecord
  belongs_to :user
  belongs_to :film_library

  has_many :film_lists, dependent: :destroy
  has_many :lists, through: :film_lists
  has_many :reviews, dependent: :destroy


  validates :film_library_id, uniqueness: { scope: :user_id }
end
