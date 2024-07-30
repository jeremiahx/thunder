# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe User, type: :model do
  context "validation tests" do
    it "ensures email is present" do
      user = described_class.new(email: nil).save
      expect(user).to be(false)
    end

    it "ensures email is valid email" do
      user = described_class.new(email: "emailexample.com").save
      expect(user).to be(false)
    end

    it "ensures email is unique" do
      described_class.new(email: "EMAIL@example.com").save
      user2 = described_class.new(email: "email@example.com").save
      expect(user2).to eq(user2)
    end

    it "ensures email is not gmail" do
      user = described_class.new(email: "bob@GMaiL.com").save
      expect(user).to be(false)
    end

    it "ensures email is not hotmail" do
      user = described_class.new(email: "bob@HoTMaiL.com").save
      expect(user).to be(false)
    end

    it "ensures email is not yahoo" do
      user = described_class.new(email: "bob@yahoo.com").save
      expect(user).to be(false)
    end

    it "saves successfully" do
      user = described_class.new(first_name: "First", last_name: "Last", email: "email@example.com").save
      expect(user).to be(true)
    end
  end
end
