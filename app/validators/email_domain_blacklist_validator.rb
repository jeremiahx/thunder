# frozen_string_literal: true

class EmailDomainBlacklistValidator < ActiveModel::Validator
  def validate(record)
    return false if record.email.blank?

    blacklist = ["gmail.com", "yahoo.com", "hotmail.com"]

    str = record.email.downcase

    # if the email contains any of the blacklisted domains case insensitive

    if blacklist.any? { |word| str&.include?(word) }
      record.errors.add :email, "cannot contain gmail.com, yahoo.com, or hotmail.com"
    end
  end
end
