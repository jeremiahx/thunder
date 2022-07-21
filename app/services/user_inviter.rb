# frozen_string_literal: true

class UserInviter
  attr_reader :to_address, :subject, :body

  def initialize(to_address:, subject:, body:)
    @to_address = to_address
    @subject = subject
    @body = body
  end

  def call
    options = [true, false]
    options[rand(0..1)]
    true
  end
end
