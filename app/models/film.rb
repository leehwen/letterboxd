class Film < ApplicationRecord
  belongs_to :user
  belongs_to :film_library
end
