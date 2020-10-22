require 'rails_helper'

Rails.describe "User API", type: :request do
  describe 'POST /users' do
    def json
      JSON.parse(response.body)
    end

    valid_attributes = { first_name: 'John', last_name: 'Cina', company_name: 'WWF'}

    context 'when request is valid' do
      before(:each) do
        post '/users', params: valid_attributes
      end

      it 'creates a user' do
        expect(json['first_name']).to eq('John')
      end

      it 'returns a status code 201' do
        expect(response).to have_http_status(201)
      end
    end

  end
end
