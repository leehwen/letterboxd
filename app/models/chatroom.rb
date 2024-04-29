class Chatroom < ApplicationRecord
  belongs_to :user1, class_name: 'User', foreign_key: 'user1_id', required: true
  belongs_to :user2, class_name: 'User', foreign_key: 'user2_id', required: true

  has_many :messages, dependent: :destroy
end
