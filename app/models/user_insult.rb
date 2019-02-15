class UserInsult < ApplicationRecord
  belongs_to :insult
  belongs_to :victim, class_name: "User"
end
