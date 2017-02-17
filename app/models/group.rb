class Group < ApplicationRecord
  validates :name, :users, presence: true
  has_many :messages
  has_many :group_users
  has_many :users, through: :group_users
end
