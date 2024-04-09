class FilmList < ApplicationRecord
  belongs_to :film
  belongs_to :list

  validates :film_id, uniqueness: { scope: :list_id, message: 'haha'}
end
