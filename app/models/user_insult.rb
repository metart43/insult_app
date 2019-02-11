class UserInsult < ApplicationRecord
  belongs_to :insult
  belongs_to :victim, class_name: "User"

  # def associate_victims(victim_id_array, insult)
  #   victim_id_array.reject(&:empty?).each do |v|
  #     insult.victims << User.find(v)
  #   end
  # end

end
