class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :films, dependent: :destroy
  has_many :lists, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :chatrooms

  validates :password, presence: true
  validates :username, :email, presence: true, uniqueness: true

  after_create :set_token

  private

  def set_token
    self.update(token:  SecureRandom.alphanumeric(32))
  end
end
