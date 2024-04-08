class List < ApplicationRecord
  belongs_to :user
  has_many :film_lists, dependent: :destroy
  has_many :films, through: :film_lists

  validates :name, presence: true, uniqueness: true
end
