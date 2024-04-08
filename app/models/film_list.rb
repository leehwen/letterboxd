class FilmList < ApplicationRecord
  belongs_to :film
  belongs_to :list
end
