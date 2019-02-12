class User < ApplicationRecord
  has_secure_password
  has_many :insults,  foreign_key: "bully_id"
  has_many :user_insults, foreign_key: "victim_id"
  has_many :user_groups
  has_many :groups, through: :user_groups
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true

  def self.search(search)
    if search
      results = []
      results << self.where("username like ?", "%#{search}%").to_a
      results << self.where("name like ?", "%#{search}%").to_a
      results.flatten
    else
      self.all
    end
  end

end
