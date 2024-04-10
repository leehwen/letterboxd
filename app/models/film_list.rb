class FilmList < ApplicationRecord
  before_save :set_filmlist_nil

  belongs_to :film
  belongs_to :list

  validates :film_id, uniqueness: { scope: :list_id}
end

private

def set_filmlist_nil
  [:notes].each do |att|
    self[att] = nil if self[att].blank?
  end
end
