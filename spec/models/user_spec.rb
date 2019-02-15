require 'rails_helper'

RSpec.describe User, type: :model do

  describe "#username" do

    it "returns the user's username" do
      ross = User.create(name: "Ross", username: "RossTheBoss", password: "ross")
      hai = User.create(name: "Hai", username: "OhHaiThere", password: "hai")
      expect(hai.username).to eq("OhHaiThere")
    end

    it "must be unique" do
      ross = User.create(name: "Ross", username: "RossTheBoss", password: "ross")
      hai = User.create(name: "Hai", username: "RossTheBoss", password: "hai")
      expect(hai).to be_invalid
    end

  end

  describe "#name" do

    it "returns the user's name" do
      ross = User.create(name: "Ross", username: "RossTheBoss", password: "ross")
      hai = User.create(name: "Hai", username: "OhHaiThere", password: "hai")
      expect(hai.name).to eq("Hai")
    end

    it "doesn't need to be unique" do
      ross = User.create(name: "Ross", username: "RossTheBoss", password: "ross")
      hai = User.create(name: "Ross", username: "OhHaiThere", password: "hai")
      expect(hai).to be_valid
    end

  end

  describe "#groups" do

    it "returns all groups the user is in" do
      ross = User.create(name: "Ross", username: "RossTheBoss", password: "ross")
      mod2 = Group.create(name: "Mod 2", description: "Mod 2 students")
      flatiron = Group.create(name: "Flatiron", description: "Flatiron students and staff")
      mod2.users << ross
      flatiron.users << ross
      expect(ross.groups).to include(flatiron)
    end

    it "doesn't include groups the user isn't a member of" do
      ross = User.create(name: "Ross", username: "RossTheBoss", password: "ross")
      mod2 = Group.create(name: "Mod 2", description: "Mod 2 students")
      flatiron = Group.create(name: "Flatiron", description: "Flatiron students and staff")
      mod2.users << ross
      expect(ross.groups).not_to include(flatiron)
    end

  end

end
