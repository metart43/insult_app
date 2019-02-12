class Insult < ApplicationRecord
  belongs_to :bully, class_name: "User"
  belongs_to :group
  has_many :user_insults
  has_many :victims, through: :user_insults, class_name: "User"

  validates :content,  length: { maximum: 144 }
end
