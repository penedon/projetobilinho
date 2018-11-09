require 'rails_helper'

RSpec.describe 'Ies API', type: :request do
  # initialize test data
  let!(:ies) { create_list(:ie, 10) }
  let(:ie_id) { ies.first.id }

  # Test suite for GET /ies
  describe 'GET /ies' do
    # make HTTP get request before each example
    before { get '/ies' }

    it 'returns ies' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
  # Test suite for GET /ies/:id
  describe 'GET /ies/:id' do
    before { get "/ies/#{ie_id}" }

    context 'when the record exists' do
      it 'returns the ie' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(ie_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:ie_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Ie with 'id'=100/)
      end
    end
  end

  # Test suite for POST /ies
 describe 'POST /ies' do
   # valid payload
   let(:valid_attributes) { { nome: 'Foobar', cnpj: '1',
                                   tipo: 'Universidade' } }

   context 'when the request is valid' do
     before { post '/ies', params: valid_attributes }

     it 'creates a ie' do
       expect(json['nome']).to eq('Foobar')
     end

     it 'returns status code 201' do
       expect(response).to have_http_status(201)
     end
   end

   context 'when the request is invalid' do
     before { post '/ies', params: { nome: 'Foobar',
                                     tipo: 'Universidade' }
             }

     it 'returns status code 422' do
       expect(response).to have_http_status(422)
     end

     it 'returns a validation failure message' do
       expect(response.body)
         .to match(/Validation failed: Cnpj is invalid/)
     end
   end
 end

end
