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
class User < ApplicationRecord
  attr_accessor :send_invite

  validates_with EmailDomainBlacklistValidator
  validates :email, presence: true, uniqueness: { case_sensitive: false }, email: true

  def display_name
    if first_name.blank? || last_name.blank?
      email[0,2].upcase
    else
      "#{first_name} #{last_name}"
    end
  end

  def initials
    if first_name.blank? || last_name.blank?
      email[0,2].upcase
    else
      "#{first_name[0,1]}#{last_name[0,1]}".upcase
    end
  end


end
