# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'GET /index' do
    it 'should return a success response' do
      get '/'
      expect(response).to have_http_status(:ok) # 200
    end
  end

  context 'GET /user/new' do
    it 'should return a success response' do
      get '/users/new'
      expect(response).to have_http_status(:ok) # 200
    end
  end
end
