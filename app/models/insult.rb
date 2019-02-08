class Insult < ApplicationRecord
  belongs_to :bully, class_name: "User"
  has_many :user_insults
  has_many :victims, through: :user_insults, class_name: "User"
end
