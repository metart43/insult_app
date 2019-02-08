class User < ApplicationRecord
  has_many :insults,  foreign_key: "bully_id"
  has_many :user_insults, foreign_key: "victim_id" 
end
