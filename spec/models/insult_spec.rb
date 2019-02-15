require 'rails_helper'

RSpec.describe Insult, type: :model do

  describe "#content" do

    it "returns the content of the insult" do
      ross = User.create(name: "Ross", username: "RossTheBoss", password: "ross")
      insult = Insult.create(bully: ross, content: "You guys are the worst")
      expect(insult.content).to eq("You guys are the worst")
    end

    it "must be present" do
      ross = User.create(name: "Ross", username: "RossTheBoss", password: "ross")
      insult = Insult.create(bully: ross)
      expect(insult).to be_invalid
    end

    it "must be under 145 characters in length" do
      ross = User.create(name: "Ross", username: "RossTheBoss", password: "ross")
      insult = Insult.create(bully: ross, content: "You guys are the worst You guys are the worst You guys are the worst You guys are the worst You guys are the worst You guys are the worst You guys are the worst")
      expect(insult).to be_invalid
    end

  end

  describe "#bully" do

    it "returns the user who created the insult" do
      ross = User.create(name: "Ross", username: "RossTheBoss", password: "ross")
      insult = Insult.create(bully: ross, content: "You guys are the worst")
      expect(insult.bully).to eq(ross)
    end

    it "must be present" do
      ross = User.create(name: "Ross", username: "RossTheBoss", password: "ross")
      insult = Insult.create(content: "You guys are the worst")
      expect(insult).to be_invalid
    end

  end

end
