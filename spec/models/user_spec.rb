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
    it "should ensure email is present" do
      user = User.new(email: nil).save
      expect(user).to eq(false)
    end

    it "should ensure email is valid email" do
      user = User.new(email: "emailexample.com").save
      expect(user).to eq(false)
    end

    it "should ensure email is unique" do
      user1 = User.new(email: "EMAIL@example.com").save
      user2 = User.new(email: "email@example.com").save
      expect(user2).to eq(user2)
    end

    it "should ensure email is not gmail" do
      user = User.new(email: "bob@gmail.com").save
      expect(user).to eq(false)
    end

    it "should ensure email is not hotmail" do
      user = User.new(email: "bob@hotmail.com").save
      expect(user).to eq(false)
    end

    it "should ensure email is not yahoo" do
      user = User.new(email: "bob@yahoo.com").save
      expect(user).to eq(false)
    end

    it "should save successfully" do
      user = User.new(first_name: "First", last_name: "Last", email: "email@example.com").save
      expect(user).to eq(true)
    end
  end
end
