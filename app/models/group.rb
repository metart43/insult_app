class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :insults

  def self.search(search)
    if search
      self.where("name like ?", "%#{search}%")
    else
      self.all
    end
  end

end
