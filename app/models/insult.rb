class Insult < ApplicationRecord
  belongs_to :bully, class_name: "User"
  belongs_to :group
  has_many :user_insults, dependent: :destroy
  has_many :victims, through: :user_insults, class_name: "User"
  validates :content, presence: true, length: { maximum: 144 }

  def upvote
    self.points += 1
  end

  def downvote
    self.points -= 1
  end

end
