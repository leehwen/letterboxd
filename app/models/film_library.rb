class FilmLibrary < ApplicationRecord
  has_many :films

  validates :tmdb_id, uniqueness: true
end
