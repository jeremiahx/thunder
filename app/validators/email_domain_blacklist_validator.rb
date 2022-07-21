class EmailDomainBlacklistValidator < ActiveModel::Validator
  def validate(record)

    blacklist = ['gmail.com', 'yahoo.com', 'hotmail.com']

    str = record.email

    if blacklist.any? { |word| str&.include?(word) }
      record.errors.add :email, 'cannot contain gmail.com, yahoo.com, or hotmail.com'
    end
  end
end