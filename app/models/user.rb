class User < ApplicationRecord
  has_secure_password
  has_many :insults,  foreign_key: "bully_id"
  has_many :user_insults, foreign_key: "victim_id"
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
end
