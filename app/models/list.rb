class List < ApplicationRecord
  before_save :set_list_nil

  belongs_to :user
  has_many :film_lists, dependent: :destroy
  has_many :films, through: :film_lists

  validates :name, presence: true, uniqueness: true
end

private

def set_list_nil
  [:description].each do |att|
    self[att] = nil if self[att].blank?
  end
end
