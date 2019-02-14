class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :insults

  validates :name, presence: true, uniqueness: true, length: { in: 6..20 }

  def self.search(search)
    if search
      self.where("name like ?", "%#{search}%")
    else
      self.all
    end
  end

  def count_users_insults_in_group(user)
    user.insults.where(group_id: self.id).count
  end

  def top_5
    self.users.sort_by {|u| count_users_insults_in_group(u)}.reverse.first(5)
  end

end
