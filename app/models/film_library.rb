class FilmLibrary < ApplicationRecord
  has_many :films
  has_many :reviews

  validates :tmdb_id, uniqueness: true
end
