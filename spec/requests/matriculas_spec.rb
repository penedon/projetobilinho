require 'rails_helper'

RSpec.describe 'Matricula API', type: :request do
  # initialize test data
  let!(:ie) { create(:ie) }
  let!(:aluno) { create(:aluno) }
  let!(:matriculas) { create_list(:matricula, 10, ie_id: ie.id, aluno_id: aluno.id) }
  let(:ie_id) { ie.id }
  let(:aluno_id) { aluno.id }
  let(:matricula_id) { matriculas.first.id }

  # Test suite for GET /matriculas
  describe 'GET /matriculas' do
    # make HTTP get request before each example
    before { get '/matriculas' }

    it 'returns matriculas' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
  # Test suite for GET /matriculas/:id
  describe 'GET /matriculas/:id' do
    before { get "/matriculas/#{matricula_id}" }

    context 'when the record exists' do
      it 'returns the matricula' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(matricula_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:matricula_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Matricula with 'id'=100/)
      end
    end
  end

  # Test suite for POST /matriculas
 describe 'POST /matriculas' do
   # valid payload
   let(:valid_attributes) { {valortotal: 12000, diavencimento: 4, curso: 'Engenharia', fatura: 12,
                                   ie_id: ie_id, aluno_id: aluno_id } }

   context 'when the request is valid' do
     before { post '/matriculas', params: valid_attributes }

     it 'creates a matricula' do
       expect(json['curso']).to eq('Engenharia')
     end

     it 'returns status code 201' do

       expect(response).to have_http_status(201)
     end

     it 'sends an email' do
       expect {matriculas.first.send_welcome_mail(ie,aluno)}
         .to change { ActionMailer::Base.deliveries.count }.by(1)
     end
   end

   context 'when the request is invalid' do
     before { post '/matriculas', params: {valortotal: 9600, curso: 'Engenharia', fatura: 12,
     ie_id: ie_id, aluno_id: aluno_id }

             }

     it 'returns status code 422' do
       expect(response).to have_http_status(422)
     end

     it 'returns a validation failure message' do
       expect(response.body)
         .to match(/Validation failed: Diavencimento is not a number, Diavencimento can't be blank/)
     end
   end
 end

end
