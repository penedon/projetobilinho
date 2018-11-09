require 'rails_helper'

RSpec.describe 'Alunos API', type: :request do
  # initialize test data
  let!(:alunos) { create_list(:aluno, 10) }
  let(:aluno_id) { alunos.first.id }

  # Test suite for GET /alunos
  describe 'GET /alunos' do
    # make HTTP get request before each example
    before { get '/alunos' }

    it 'returns alunos' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
  # Test suite for GET /alunos/:id
  describe 'GET /alunos/:id' do
    before { get "/alunos/#{aluno_id}" }

    context 'when the record exists' do
      it 'returns the aluno' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(aluno_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:aluno_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Aluno with 'id'=100/)
      end
    end
  end

  # Test suite for POST /alunos
 describe 'POST /alunos' do
   # valid payload
   let(:valid_attributes) { { nome: 'Foobar', cpf: '1',
                                   genero: 'M', tipopagamento: 'Boleto' } }

   context 'when the request is valid' do
     before { post '/alunos', params: valid_attributes }

     it 'creates an aluno' do
       expect(json['nome']).to eq('Foobar')
     end

     it 'returns status code 201' do
       expect(response).to have_http_status(201)
     end
   end

   context 'when the request is invalid' do
     before { post '/alunos', params: { nome: 'Foobar',
                                        genero: 'M', tipopagamento: 'Boleto' }

             }

     it 'returns status code 422' do
       expect(response).to have_http_status(422)
     end

     it 'returns a validation failure message' do
       expect(response.body)
         .to match(/Validation failed: Cpf is invalid/)
     end
   end
 end

end
